import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/authentication/services/models/user_model.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';

import '../../../core/error/failures.dart';
import '../../../resources/app_strings.dart';
import '../../general/services/general_repo.dart';
import '../services/home_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final HomeRepo homeRepo;
  final GeneralRepo generalRepo;

  HomeScreenCubit(this.homeRepo, this.generalRepo) : super(HomeScreenInitial());

  emitInitialState() {
    emit(HomeScreenInitial());
  }

  static HomeScreenCubit getIns(BuildContext context) {
    return BlocProvider.of<HomeScreenCubit>(context);
  }

  Future getData() async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 7));
    final either1 = await generalRepo.getUserData();
    final either2 = await homeRepo.getQuizzes();
    either1.fold(
      (l1) {
        _handleFailure(l1);
      },
      (r1) {
        either2.fold(
          (l2) {
            _handleFailure(l2);
          },
          (r2) {
            emit(HomeScreenGetData(userModel: r1, quizzes: r2));
          },
        );
      },
    );
  }

  String? validateField(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.emptyValue.tr(context);
    } else {
      return null;
    }
  }

  _handleFailure(Failure failure) {
    if (failure.runtimeType == OfflineFailure) {
      emit(const HomeEndLoadingWithFailureState(
          text: AppStrings.internetConnectionError));
    } else if (failure.runtimeType == ServerFailure) {
      emit(const HomeEndLoadingWithFailureState(
          text: AppStrings.someThingWentWrong));
    } else if (failure.runtimeType == CacheSavingFailure) {
      emit(const HomeEndLoadingWithFailureState(
          text: AppStrings.savingTokenError));
    }
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/authentication/services/models/user_model.dart';

import '../../../../core/error/failures.dart';
import '../../../resources/app_strings.dart';
import '../../general/services/general_repo.dart';
import '../services/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  final GeneralRepo generalRepo;

  AuthCubit({
    required this.authRepo,
    required this.generalRepo,
  }) : super(AuthInitial());

  static AuthCubit getIns(context) {
    return BlocProvider.of<AuthCubit>(context);
  }

  validateName(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppStrings.emptyValue.tr(context);
    } else {
      return null;
    }
  }

  validateEmail(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppStrings.emptyValue.tr(context);
    }
    final isValid = EmailValidator.validate(value);
    if (isValid) {
      return null;
    }
    return AppStrings.invalidEmail.tr(context);
  }

  validatePassword(BuildContext context, String value) {
    if (value.isEmpty) {
      return AppStrings.emptyValue.tr(context);
    }
    if (value.length < 5) {
      return AppStrings.passwordMustBe.tr(context);
    }
    return null;
  }

  validateSecondPassword(BuildContext context, String value, String firstPass) {
    if (value.isEmpty) {
      return AppStrings.emptyValue.tr(context);
    }
    if (value != firstPass) {
      return AppStrings.twoPasswordsNotIdentical.tr(context);
    }
    return null;
  }

  Future login(
      String email, String password, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      //
      emit(StartLoadingState());
      final either = await authRepo.signInWithEmailAndPassword(email, password);
      either.fold(
        (failure) {
          _handleFailure(failure);
        },
        (credential) async {
          //
          final String id = credential.user!.uid;
          await generalRepo.setString(AppStrings.storedId, id);
          //
          final temp1 = await _saveToken(credential);
          if (temp1) {
            emit(EndLoadingToHomeScreen());
          } else {
            emit(EndLoadingStateWithError(AppStrings.someThingWentWrong));
          }
        },
      );
    }
  }

  Future createNewUser(
      UserModel userModel, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      emit(StartLoadingState());
      final either1 = await authRepo.createUserWithEmailAndPassword(
        userModel.email,
        userModel.password,
      );
      either1.fold(
        (failure) {
          _handleFailure(failure);
        },
        (credential) async {
          final String id = credential.user!.uid;
          await generalRepo.setString(AppStrings.storedId, id);
          //
          final either2 = await authRepo
              .createUserAfterSign(userModel.copyWith(userId: id));
          //
          final temp1 = await _saveToken(credential);
          if (temp1) {
            either2.fold(
              (l) {
                emit(EndLoadingStateWithError(AppStrings.someThingWentWrong));
              },
              (r) {
                emit(EndLoadingToHomeScreen());
              },
            );
          } else {
            emit(EndLoadingStateWithError(AppStrings.someThingWentWrong));
          }
        },
      );
    }
  }

  _handleFailure(Failure failure) {
    if (failure.runtimeType == OfflineFailure) {
      emit(EndLoadingStateWithError(AppStrings.internetConnectionError));
    } else if (failure.runtimeType == ServerFailure) {
      emit(EndLoadingStateWithError(AppStrings.someThingWentWrong));
    } else if (failure.runtimeType == WeakPasswordFailure) {
      emit(EndLoadingStateWithError(AppStrings.weakPassword));
    } else if (failure.runtimeType == EmailInUseFailure) {
      emit(EndLoadingStateWithError(AppStrings.emailInUse));
    } else if (failure.runtimeType == UserNotFoundFailure) {
      emit(EndLoadingStateWithError(AppStrings.userNotFound));
    } else if (failure.runtimeType == WrongPasswordFailure) {
      emit(EndLoadingStateWithError(AppStrings.wrongPassword));
    } else if (failure.runtimeType == CacheSavingFailure) {
      emit(EndLoadingStateWithError(AppStrings.savingTokenError));
    } else if (failure.runtimeType == InvalidEmailFailure) {
      emit(EndLoadingStateWithError(AppStrings.invalidEmail));
    }
  }

  Future<bool> _saveToken(UserCredential credential) async {
    final token = await credential.user?.getIdToken();
    if (token != null) {
      final either = await generalRepo.setString(AppStrings.storedToken, token);
      return either.fold((failure) {
        _handleFailure(failure);
        return false;
      }, (success) {
        return true;
      });
    } else {
      debugPrint('The token is nullllllllllll!');
      return false;
    }
  }
}

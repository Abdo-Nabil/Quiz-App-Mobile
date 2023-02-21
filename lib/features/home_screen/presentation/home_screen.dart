import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import '../../../core/util/dialog_helper.dart';
import '../../../core/util/toast_helper.dart';
import '../../../resources/app_strings.dart';
import '../cubits/home_screen_cubit.dart';

//
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //

  Timer? refreshCaptainLocationTimer;
  @override
  void initState() {
    ToastHelper.initializeToast(context);
    super.initState();
  }

  @override
  void dispose() {
    refreshCaptainLocationTimer?.cancel();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocListener<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          //
          if (state is HomeLoadingState) {
            DialogHelper.loadingDialog(context);
          }
          //
          else if (state is HomeConnectionFailureState) {
            Navigator.pop(context);
            DialogHelper.messageDialog(
                context, AppStrings.internetConnectionError.tr(context));
          }
          //
          else if (state is HomeLocPermissionDeniedState) {
            DialogHelper.messageDialog(
                context, AppStrings.givePermission.tr(context));
          }
          //
          else if (state is HomeServerFailureWithPopState) {
            Navigator.pop(context);
            DialogHelper.messageDialog(
                context, AppStrings.someThingWentWrong.tr(context));
          }
          //
          else if (state is HomeConnectionFailureWithPopState) {
            Navigator.pop(context);
            DialogHelper.messageDialog(
                context, AppStrings.internetConnectionError.tr(context));
          }
          //
          else if (state is HomeFailureWithoutPopState) {
            DialogHelper.messageDialog(
                context, AppStrings.someThingWentWrong.tr(context));
          }
          //

          //
          else if (state is HomeSuccessWithPopState) {
            Navigator.pop(context);
          }
          //
          else if (state is HomeWithToastState) {
            ToastHelper.showToast(
                context, state.msg.tr(context), state.toastState);
          }
          //
        },
        child: Scaffold(
          //TODO: Note
          // resizeToAvoidBottomInset: false,
          body: Stack(
            alignment: Alignment.center,
            children: const [],
          ),
        ),
      ),
    );
  }
}

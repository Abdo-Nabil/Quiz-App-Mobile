import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/core/widgets/error_bloc.dart';
import 'package:quiz_app/features/home_screen/presentation/components/available_quizzes.dart';
import '../../../core/util/dialog_helper.dart';
import '../../../core/util/toast_helper.dart';
import '../../authentication/services/models/user_model.dart';
import '../../shared/components/background_image.dart';
import '../cubits/home_screen_cubit.dart';
import 'components/body.dart';
import 'components/greeting_text.dart';

//
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  late UserModel userData;
  @override
  void initState() {
    ToastHelper.initializeToast(context);
    initHomeScreenWithData();
    super.initState();
  }

  initHomeScreenWithData() async {
    await HomeScreenCubit.getIns(context).getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    // final List quizzes = [
    //   QuizModel(
    //     quizId: 'jhjhkhk',
    //     quizName: 'Quiz 1',
    //     quizDuration: 60,
    //     questions: [
    //       QuestionModel(
    //         questionId: 'hghjghjgj',
    //         question: 'how many fingers in one hand ?',
    //         options: [
    //           'one',
    //           'two',
    //           'three',
    //           'five',
    //         ],
    //         answerIndex: 3,
    //       )
    //     ],
    //   ),
    // ];
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
        listener: (context, state) {
          // debugPrint('state: $state');
          // if (state is HomeLoadingState) {
          //   DialogHelper.loadingDialog(context);
          // }
          if (state is HomeEndLoadingWithFailureState) {
            // Navigator.pop(context);
            DialogHelper.messageDialogWithRetry(
              context,
              state.text.tr(context),
              () {
                HomeScreenCubit.getIns(context).getData();
              },
            );
          }
        },
        builder: (context, state) {
          if (state is HomeScreenGetData) {
            return Scaffold(
              body: Stack(
                // fit: StackFit.expand,
                children: [
                  const BackgroundImage(),
                  SafeArea(
                    child: Column(
                      children: [
                        GreetingText(state.userModel.name),
                        AvailableQuizzes(state.quizzes.length),
                        Body(
                          quizzes: state.quizzes,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          //
          else if (state is HomeLoadingState) {
            return Scaffold(
              body: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: [
                  const BackgroundImage(),
                  Container(
                    color: Colors.black54,
                    child: const LoadingDialog(),
                  )
                ],
              ),
            );
          }
          //
          else if (state is HomeEndLoadingWithFailureState) {
            return Scaffold(
              body: Stack(
                children: const [
                  BackgroundImage(),
                ],
              ),
            );
          }
          //
          return const Scaffold(body: ErrorBloc());
        },
      ),
    );
  }
}

// else if (state is HomeScreenGetUserData) {
//   Navigator.pop(context);
// }
//
// else if (state is HomeConnectionFailureState) {
//   Navigator.pop(context);
//   DialogHelper.messageDialog(
//       context, AppStrings.internetConnectionError.tr(context));
// }
//
// else if (state is HomeLocPermissionDeniedState) {
//   DialogHelper.messageDialog(
//       context, AppStrings.givePermission.tr(context));
// }
// //
// else if (state is HomeServerFailureWithPopState) {
//   Navigator.pop(context);
//   DialogHelper.messageDialog(
//       context, AppStrings.someThingWentWrong.tr(context));
// }
//
// else if (state is HomeConnectionFailureWithPopState) {
//   Navigator.pop(context);
//   DialogHelper.messageDialog(
//       context, AppStrings.internetConnectionError.tr(context));
// }
// //
// else if (state is HomeFailureWithoutPopState) {
//   DialogHelper.messageDialog(
//       context, AppStrings.someThingWentWrong.tr(context));
// }
// //
// else if (state is HomeSuccessWithPopState) {
//   Navigator.pop(context);
// }
// //
// else if (state is HomeWithToastState) {
//   ToastHelper.showToast(
//       context, state.msg.tr(context), state.toastState);
// }
// //

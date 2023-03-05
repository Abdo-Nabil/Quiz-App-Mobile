import 'package:flutter/material.dart';
import 'package:quiz_app/core/widgets/add_vertical_space.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';
import 'package:quiz_app/features/quiz_screen/cubits/quiz_screen_cubit.dart';
import 'package:quiz_app/features/shared/components/background_image.dart';
import 'package:quiz_app/resources/app_margins_paddings.dart';

import 'components/quiz_body.dart';
import 'components/quiz_header.dart';
import 'components/quiz_tail.dart';

class QuizScreen extends StatelessWidget {
  final QuizModel quizModel;
  const QuizScreen({
    required this.quizModel,
    Key? key,
  }) : super(key: key);

  static const String routeName = 'quiz_screen';

  @override
  Widget build(BuildContext context) {
    //
    QuizScreenCubit.getInst(context).quizModel = quizModel;
    debugPrint('build Quiz Screen !!!!<<<<<<   >>>>>>>>>!!!!');
    //
    return WillPopScope(
      onWillPop: () {
        return QuizScreenCubit.getInst(context).onFinishQuiz(context);
      },
      child: Scaffold(
        body: Stack(
          children: [
            const BackgroundImage(),
            SafeArea(
              child: Column(
                children: const [
                  QuizHeader(),
                  AddVerticalSpace(AppPadding.p16),
                  QuizBody(),
                  QuizTail(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

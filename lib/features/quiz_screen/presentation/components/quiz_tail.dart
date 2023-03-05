import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';

import '../../../../resources/app_strings.dart';
import '../../../home_screen/services/models/quiz_model.dart';
import '../../cubits/quiz_screen_cubit.dart';

class QuizTail extends StatelessWidget {
  const QuizTail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final QuizScreenCubit quizScreenCubit = QuizScreenCubit.getInst(context);
    final QuizModel quizModel = quizScreenCubit.quizModel!;
    //
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: BlocProvider.of<QuizScreenCubit>(context, listen: true)
                      .questionNumber ==
                  1
              ? null
              : () {
                  quizScreenCubit.toPreviousPage();
                },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
          ),
          disabledColor: Colors.blueGrey,
        ),
        BlocProvider.of<QuizScreenCubit>(context, listen: true)
                    .questionNumber ==
                quizModel.questions.length
            ? TextButton(
                onPressed: () {
                  quizScreenCubit.onFinishQuiz(context);
                },
                child: Text(
                  AppStrings.finish.tr(context),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            : IconButton(
                onPressed: () {
                  quizScreenCubit.toNextPage();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios_sharp,
                ),
                disabledColor: Colors.blueGrey,
              ),
      ],
    );
  }
}

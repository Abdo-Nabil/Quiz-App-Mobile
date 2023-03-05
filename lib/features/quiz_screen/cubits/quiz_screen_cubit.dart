import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/string_extension.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';

import '../../../core/util/dialog_helper.dart';
import '../../../core/util/navigator_helper.dart';
import '../../../resources/app_strings.dart';
import '../../score_screen/score_screen.dart';

part 'quiz_screen_state.dart';

class QuizScreenCubit extends Cubit<QuizScreenState> {
  QuizScreenCubit() : super(QuizScreenInitial());

  static QuizScreenCubit getInst(BuildContext context) {
    return BlocProvider.of<QuizScreenCubit>(context);
  }

  PageController quizPageViewController = PageController();

  int questionNumber = 1;
  QuizModel? quizModel;

  onPageChanged(int index) {
    questionNumber = index + 1;
    emit(QuizScreenPageChangedState());
  }

  List _modalAnswers = [];
  List _userAnswers = [];
  List optionsList = [];
  // optionList = [ [false,false,false],[false,false,false] ];

  initiateLists() {
    //
    _modalAnswers.clear();
    _userAnswers.clear();
    optionsList.clear();
    //
    for (var x in quizModel!.questions) {
      _modalAnswers.add(x.answerIndex);
    }
    //
    for (var x in quizModel!.questions) {
      _userAnswers.add(-1);
    }
    //
    for (var x in quizModel!.questions) {
      optionsList.add(List.generate(x.options.length, (index) => false));
    }
  }

  onOptionSelect(int questionIndex, int optionIndex) {
    //clean the required list first
    for (int x = 0; x < optionsList[questionIndex].length; x++) {
      optionsList[questionIndex][x] = false;
    }
    //select the option by converting its index to true (UI only)
    optionsList[questionIndex][optionIndex] = true;
    //
    _userAnswers[questionIndex] = optionIndex;

    //emit to show changes
    emit(QuizScreenSelectState());
  }

  toNextPage() {
    quizPageViewController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  toPreviousPage() {
    quizPageViewController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  onQuizTimeout(BuildContext context) {
    String score = _getUserScore();
    DialogHelper.messageWithActionDialog(
        title: AppStrings.timeOut.tr(context),
        context,
        AppStrings.quizTimeEnded.tr(context), () {
      NavigatorHelper.pushReplacement(
        context,
        ScoreScreen(
          score: score,
        ),
      );
    });
  }

  onFinishQuiz(BuildContext context) {
    String score = _getUserScore();
    return DialogHelper.messageWithActionsDialog(
        context, AppStrings.finishQuiz.tr(context), () {
      NavigatorHelper.pushReplacement(
        context,
        ScoreScreen(
          score: score,
        ),
      );
    });
  }

  String _getUserScore() {
    int score = 0;
    for (int x = 0; x < _modalAnswers.length; x++) {
      if (_modalAnswers[x] == _userAnswers[x]) {
        score++;
      }
    }
    return '$score/${_modalAnswers.length}';
  }
}

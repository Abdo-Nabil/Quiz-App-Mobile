import 'package:quiz_app/features/home_screen/services/models/question_model.dart';

class QuizModel {
  final String? quizId;
  final String quizName;
  final int quizDuration;
  final List<QuestionModel> questions;

  QuizModel({
    required this.quizId,
    required this.quizName,
    required this.quizDuration,
    required this.questions,
  });

  factory QuizModel.fromJson(Map<String, dynamic> map) {
    final List<QuestionModel> questionsList = [];
    if (map['questions'] != null) {
      for (var e in map['questions']) {
        questionsList.add(QuestionModel.fromJson(e));
      }
    }
    return QuizModel(
      quizId: map['quizId'],
      quizName: map['quizName'],
      quizDuration: map['quizDuration'],
      questions: questionsList,
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> questionList = [];
    for (var e in questions) {
      questionList.add(e.toJson());
    }
    return {
      'quizId': quizId,
      'quizName': quizName,
      'quizDuration': quizDuration,
      'questions': questionList,
    };
  }
}

class QuestionModel {
  final String questionId;
  final String question;
  final List options;
  final int answerIndex;

  QuestionModel({
    required this.questionId,
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> map) {
    return QuestionModel(
      questionId: map['questionId'],
      question: map['question'],
      options: map['options'],
      answerIndex: map['answerIndex'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'question': question,
      'options': options,
      'answerIndex': answerIndex,
    };
  }
}

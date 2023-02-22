import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';

import '../../../core/error/exceptions.dart';

class HomeRemoteData {
  final http.Client client;

  HomeRemoteData({
    required this.client,
  });

  Future<List<QuizModel>> getQuizzes() async {
    //
    try {
      final db = FirebaseFirestore.instance;
      final docRef = db.collection("quizzes");
      final result = await docRef.get();
      List<QuizModel> quizzes = [];
      final z = result.docs;
      for (var e in z) {
        quizzes.add(QuizModel.fromJson(e.data()));
      }
      return quizzes;
    } catch (e) {
      debugPrint("HomeRemoteData :: getQuizzes :: Exception :: $e");
      throw ServerException();
    }
  }
}

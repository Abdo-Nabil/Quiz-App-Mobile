import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/core/error/exceptions.dart';
import '../../authentication/services/models/user_model.dart';

class GeneralRemoteData {
  //
  Future<UserModel> getUserData() async {
    //
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final db = FirebaseFirestore.instance;
      final docRef = db.collection("users").doc(userId);
      final DocumentSnapshot result = await docRef.get();
      final jsonData = result.data() as Map<String, dynamic>;
      final userData = UserModel.fromJson(jsonData);
      return userData;
    } catch (e) {
      debugPrint("GeneralRemoteData :: getUserData :: Exception :: $e");
      throw ServerException();
    }
  }

  //
  Future<String> fetchBuildNumber() async {
    try {
      final db = FirebaseFirestore.instance;
      final docRef = db.collection("buildNumber").doc("buildNumber");
      final DocumentSnapshot result = await docRef.get();
      final jsonData = result.data() as Map<String, dynamic>;
      return jsonData['buildNumber'];
    } catch (e) {
      debugPrint("GeneralRemoteData :: fetchBuildNumber :: Exception :: $e");
      throw ServerException();
    }
  }
}

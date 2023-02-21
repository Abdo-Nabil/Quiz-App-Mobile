import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz_app/features/authentication/services/models/user_model.dart';

import '../../../core/error/exceptions.dart';

class AuthRemoteData {
  UserCredential? userCredential;
  late String phone;
  late String userId;

  //
  //
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential = credential;
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        throw EmailInUseException();
      } else if (e.code == 'invalid-email') {
        debugPrint('the email address is not valid');
        throw InvalidEmailException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      debugPrint(
          'createUserWithEmailAndPassword :: Auth remote repo :: Exception :: $e');
      throw ServerException();
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userCredential = credential;
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        throw UserNotFoundException();
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        throw WrongPasswordException();
      } else if (e.code == 'invalid-email') {
        debugPrint('the email address is not valid');
        throw InvalidEmailException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      debugPrint(
          'signInWithEmailAndPassword :: Auth remote repo :: Exception :: $e');
      throw ServerException();
    }
  }

  Future createUserAfterSign(UserModel userModel) async {
    try {
      final db = FirebaseFirestore.instance;
      // await db.collection('captains').add(captainModel.toJson());
      await db
          .collection('users')
          .doc(userModel.userId)
          .set(userModel.toJson());
    } catch (e) {
      debugPrint('createUserAfterSign :: Auth remote repo :: Exception :: $e');
      throw ServerException();
    }
  }
}

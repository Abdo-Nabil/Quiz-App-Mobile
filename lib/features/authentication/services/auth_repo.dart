import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import 'auth_local_data.dart';
import 'auth_remote_data.dart';
import 'models/user_model.dart';

class AuthRepo {
  final NetworkInfo networkInfo;
  final AuthRemoteData authRemoteData;
  final AuthLocalData authLocalData;
  AuthRepo({
    required this.networkInfo,
    required this.authRemoteData,
    required this.authLocalData,
  });

  //-------------Auth remote data--------------------

  //
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final credential = await authRemoteData.createUserWithEmailAndPassword(
            email, password);
        return Right(credential);
      } on WeakPasswordException {
        return Left(WeakPasswordFailure());
      } on EmailInUseException {
        return Left(EmailInUseFailure());
      } on InvalidEmailException {
        return Left(InvalidEmailFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        final credential =
            await authRemoteData.signInWithEmailAndPassword(email, password);
        return Right(credential);
      } on UserNotFoundException {
        return Left(UserNotFoundFailure());
      } on WrongPasswordException {
        return Left(WrongPasswordFailure());
      } on InvalidEmailException {
        return Left(InvalidEmailFailure());
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<Either<Failure, Unit>> createUserAfterSign(UserModel userModel) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteData.createUserAfterSign(userModel);
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  //-------------Auth local data--------------------
}

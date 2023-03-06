import 'package:dartz/dartz.dart';
import 'package:quiz_app/features/authentication/services/models/user_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import 'general_local_data.dart';
import 'general_remote_data.dart';

class GeneralRepo {
  final GeneralRemoteData generalRemoteData;
  final GeneralLocalData generalLocalData;
  final NetworkInfo networkInfo;

  GeneralRepo({
    required this.generalRemoteData,
    required this.generalLocalData,
    required this.networkInfo,
  });

  static late UserModel userData;

  //-------------General local data--------------------
  String? getString(String key) {
    final String? result = generalLocalData.getString(key);
    return result;
  }

  Future<Either<Failure, Unit>> setString(String key, String value) async {
    try {
      await generalLocalData.setString(key, value);
      return Future.value(const Right(unit));
    } on CacheSavingException {
      return Left(CacheSavingFailure());
    }
  }

  Future<Either<Failure, Unit>> removeKey(String key) async {
    try {
      await generalLocalData.removeKey(key);
      return Future.value(const Right(unit));
    } on CacheRemovingException {
      return Left(CacheRemovingFailure());
    }
  }

//-------------General remote data--------------------
  Future<Either<Failure, UserModel>> getUserData() async {
    //
    if (await networkInfo.isConnected) {
      try {
        final UserModel uData = await generalRemoteData.getUserData();
        userData = uData;
        return Right(userData);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
    //
  }
}

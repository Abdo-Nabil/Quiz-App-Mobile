import 'package:dartz/dartz.dart';
import 'package:quiz_app/features/home_screen/services/models/quiz_model.dart';

import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import 'home_local_data.dart';
import 'home_remote_data.dart';

class HomeRepo {
  final HomeRemoteData homeRemoteData;
  final HomeLocalData homeLocalData;
  final NetworkInfo networkInfo;
  HomeRepo(this.homeRemoteData, this.homeLocalData, this.networkInfo);

  //-----------------Local data source-----------------

  //
  //
  //-----------------Remote data source-----------------

  Future<Either<Failure, List<QuizModel>>> getQuizzes() async {
    if (await networkInfo.isConnected) {
      try {
        final quizzesList = await homeRemoteData.getQuizzes();
        return Right(quizzesList);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  Future<bool> isConnected() async {
    return await networkInfo.isConnected;
  }
}

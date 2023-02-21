import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

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

  Future<bool> isConnected() async {
    return await networkInfo.isConnected;
  }
}

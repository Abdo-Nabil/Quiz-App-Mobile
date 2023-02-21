import 'dart:async';

import 'package:flutter/material.dart';

delayedOnChange({
  required String value,
  required Timer? timer,
  required int durationInMillis,
  required int minCharLength,
  required Function onChange,
  required Function onNoChange,
}) {
  if (timer != null) {
    timer.cancel();
  }
  timer = Timer(
    Duration(milliseconds: value.isEmpty ? 0 : durationInMillis),
    () async {
      if (value.length > minCharLength) {
        onChange();
      } else if (value.isEmpty) {
        onNoChange();
      }
    },
  );

  // if (_timer != null) {
  //   _timer?.cancel();
  // }
  // _timer = Timer(
  //   Duration(milliseconds: value.isEmpty ? 0 : 2000),
  //   () async {
  //     if (value.length > 1) {
  //       await HomeScreenCubit.getIns(context).searchForPlace(
  //         _formKey,
  //         value,
  //         isEnglishLocale,
  //       );
  //     } else if (value.isEmpty) {
  //       HomeScreenCubit.getIns(context).emitInitialState();
  //     }
  //   },
  // );
}

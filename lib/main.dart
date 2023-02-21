import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'my_app.dart';

void main() async {
  //Avoid printing in Release Mode if you use debugPrint
  if (kReleaseMode) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  //
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

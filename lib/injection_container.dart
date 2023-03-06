import 'package:get_it/get_it.dart';

import 'core/network/network_info.dart';
import 'features/authentication/cubits/auth_cubit.dart';
import 'features/authentication/services/auth_local_data.dart';
import 'features/authentication/services/auth_remote_data.dart';
import 'features/authentication/services/auth_repo.dart';
import 'features/general/cubits/general_cubit.dart';
import 'features/general/services/general_local_data.dart';
import 'features/general/services/general_remote_data.dart';
import 'features/general/services/general_repo.dart';
import 'features/home_screen/cubits/home_screen_cubit.dart';

import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home_screen/services/home_local_data.dart';
import 'features/home_screen/services/home_remote_data.dart';
import 'features/home_screen/services/home_repo.dart';
import 'features/localization/presentation/cubits/localization_cubit.dart';
import 'features/quiz_screen/cubits/quiz_screen_cubit.dart';
import 'features/theme/cubits/theme_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initLocalization();
  await initTheme();
  await initGeneralCubit();
  await initializeAuth();
  await initHomeScreen();
  await initQuizScreen();
  await initScoreScreen();
}

Future<void> initLocalization() async {
//
//---------------------* Localization *-------------------------------
//! Features - Localization

//! Bloc

  sl.registerFactory(() => LocalizationCubit(
        sharedPreferences: sl(),
      ));

//! Use Cases
//! Repository
//! Data Sources
//! Core
//! External
//
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
}

Future<void> initTheme() async {
//
//---------------------* Theme *-------------------------------
//! Features - Theme

//! Bloc

  sl.registerFactory(() => ThemeCubit(sharedPreferences: sl()));

//! Use Cases
//! Repository
//! Data Sources
//! Core
//! External

  //****** These lines have been implemented in Localization Feature ******
  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
}

Future<void> initGeneralCubit() async {
//
//---------------------* initGeneralCubit *-------------------------------

//! Bloc

  sl.registerFactory(
      () => GeneralCubit(generalLocalData: sl(), generalRemoteData: sl()));

  sl.registerLazySingleton<GeneralRemoteData>(() => GeneralRemoteData());
  sl.registerLazySingleton<GeneralLocalData>(
    () => GeneralLocalData(
      sharedPreferences: sl(),
    ),
  );
  sl.registerLazySingleton<GeneralRepo>(
    () => GeneralRepo(
      generalRemoteData: sl(),
      generalLocalData: sl(),
      networkInfo: sl(),
    ),
  );
//! Use Cases
//! Repository
//! Data Sources
//! Core
//! External
}

Future<void> initializeAuth() async {
//
//---------------------* Authentication *-------------------------------

//! Features - Authentication

//! Bloc

  sl.registerFactory(() => AuthCubit(
        authRepo: sl(),
        generalRepo: sl(),
      ));

  sl.registerLazySingleton<AuthRemoteData>(() => AuthRemoteData());
  sl.registerLazySingleton<AuthLocalData>(
      () => AuthLocalData(sharedPreferences: sl()));
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(
        authRemoteData: sl(),
        authLocalData: sl(),
        networkInfo: sl(),
      ));

//! Use Cases
//! Repository
//! Data Sources
//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

Future<void> initHomeScreen() async {
  sl.registerFactory(() => HomeScreenCubit(sl(), sl(), sl()));

  sl.registerLazySingleton<HomeRemoteData>(() => HomeRemoteData(client: sl()));
  sl.registerLazySingleton<HomeLocalData>(() => HomeLocalData());
  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl(), sl(), sl()));
}

Future<void> initQuizScreen() async {
  sl.registerFactory(() => QuizScreenCubit());

  // sl.registerLazySingleton<HomeRemoteData>(() => HomeRemoteData(client: sl()));
  // sl.registerLazySingleton<HomeLocalData>(() => HomeLocalData());
  // sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl(), sl(), sl()));
}

Future<void> initScoreScreen() async {
  // sl.registerFactory(() => initScoreScreenCubit());

  // sl.registerLazySingleton<HomeRemoteData>(() => HomeRemoteData(client: sl()));
  // sl.registerLazySingleton<HomeLocalData>(() => HomeLocalData());
  // sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl(), sl(), sl()));
}
//-----------------------------------------------------------------
//
// //! Features - posts
//
// // Bloc
//
//   sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
//   sl.registerFactory(() => AddDeleteUpdatePostBloc(
//       addPost: sl(), updatePost: sl(), deletePost: sl()));
//
// // Usecases
//
//   sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
//   sl.registerLazySingleton(() => AddPostUsecase(sl()));
//   sl.registerLazySingleton(() => DeletePostUsecase(sl()));
//   sl.registerLazySingleton(() => UpdatePostUsecase(sl()));
//
// // Repository
//
//   sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
//       remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
//
// // Datasources
//
//   sl.registerLazySingleton<PostRemoteDataSource>(
//       () => PostRemoteDataSourceImpl(client: sl()));
//   sl.registerLazySingleton<PostLocalDataSource>(
//       () => PostLocalDataSourceImpl(sharedPreferences: sl()));
//
// //! Core
//
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//
// //! External
//
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton(() => sharedPreferences);
//   sl.registerLazySingleton(() => http.Client());
//   sl.registerLazySingleton(() => InternetConnectionChecker());

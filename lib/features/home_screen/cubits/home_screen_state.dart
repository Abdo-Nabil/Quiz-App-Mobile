part of 'home_screen_cubit.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenSignOutSuccessState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenNeedAppUpdateState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenGetData extends HomeScreenState {
  final UserModel userModel;
  final List<QuizModel> quizzes;
  const HomeScreenGetData({required this.userModel, required this.quizzes});

  @override
  List<Object> get props => [userModel, quizzes];
}

class HomeEndLoadingWithFailureState extends HomeScreenState {
  final String text;
  const HomeEndLoadingWithFailureState({required this.text});
  @override
  List<Object> get props => [text];
}

part of 'quiz_screen_cubit.dart';

abstract class QuizScreenState extends Equatable {
  const QuizScreenState();
}

class QuizScreenInitial extends QuizScreenState {
  @override
  List<Object> get props => [];
}

class QuizScreenSelectState extends QuizScreenState {
  @override
  List<Object> get props => [identityHashCode(this)];
}

class QuizScreenPageChangedState extends QuizScreenState {
  const QuizScreenPageChangedState();
  @override
  List<Object> get props => [identityHashCode(this)];
}

part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
}

class ThemeChangedState extends ThemeState {
  final ThemeMode themeMode;
  const ThemeChangedState(this.themeMode);

  @override
  List<Object> get props => [themeMode];
}

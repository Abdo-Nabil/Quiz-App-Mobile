part of 'localization_cubit.dart';

abstract class LocalizationState extends Equatable {
  const LocalizationState();
}

class LocalizationInitial extends LocalizationState {
  @override
  List<Object> get props => [];
}

class LocalizationSuccessState extends LocalizationState {
  final Locale locale;
  const LocalizationSuccessState({required this.locale});
  @override
  List<Object> get props => [locale];
}

class LocalizationErrorState extends LocalizationState {
  final String errorMsg;
  const LocalizationErrorState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}

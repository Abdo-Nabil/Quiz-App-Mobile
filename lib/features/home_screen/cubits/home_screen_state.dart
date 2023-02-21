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

class HomeSuccessWithPopState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeSuccessWithoutPopState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeServerFailureWithPopState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeConnectionFailureWithPopState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeFailureWithoutPopState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeConnectionFailureState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeLocPermissionDeniedState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeRefreshMarkerState extends HomeScreenState {
  final String latLng;
  const HomeRefreshMarkerState(this.latLng);
  @override
  List<Object> get props => [latLng];
}

class OpenAppSettingState extends HomeScreenState {
  final String msg;
  const OpenAppSettingState(this.msg);
  @override
  List<Object> get props => [identityHashCode(this)];
}

class OpenLocationSettingState extends HomeScreenState {
  final String msg;
  const OpenLocationSettingState(this.msg);
  @override
  List<Object> get props => [identityHashCode(this)];
}

//Location screen states
//

class SelectLocationLoadingState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class SearchPlaceSuccessState extends HomeScreenState {
  final List places;
  const SearchPlaceSuccessState(this.places);
  @override
  List<Object> get props => [places];
}

class SearchPlaceConnectionFailureState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class SearchPlaceServerFailureState extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeWithToastState extends HomeScreenState {
  final String msg;
  final ToastStates toastState;
  const HomeWithToastState(this.msg, this.toastState);
  @override
  List<Object> get props => [identityHashCode(this)];
}

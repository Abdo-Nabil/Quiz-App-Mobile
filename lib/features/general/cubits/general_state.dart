import 'package:equatable/equatable.dart';

abstract class GeneralState extends Equatable {
  const GeneralState();
}

class GeneralInitial extends GeneralState {
  @override
  List<Object> get props => [];
}

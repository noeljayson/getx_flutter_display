
import 'package:equatable/equatable.dart';

import '../../model/demomodel.dart';


class DemoState extends Equatable {
  @override
  List<Object> get props => [];
}

class DemoInitialState extends DemoState {
  @override
  List<Object> get props => [];
}

class DemoLoadingState extends DemoState {
  @override
  List<Object> get props => [];
}

class DemoLoadedState extends DemoState {
  final List<DemoModel> demoModel;

  DemoLoadedState({required this.demoModel});

  @override
  List<Object> get props => [];
}

class DemoErrorState extends DemoState {
  String message;

  DemoErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

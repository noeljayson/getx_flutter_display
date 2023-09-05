
import 'package:equatable/equatable.dart';
import 'package:getx_flutter/model/democodemodel.dart';

import '../../model/demomodel.dart';


class DemoCodeState extends Equatable {
  @override
  List<Object> get props => [];
}

class DemoCodeInitialState extends DemoCodeState {
  @override
  List<Object> get props => [];
}

class DemoCodeLoadingState extends DemoCodeState {
  @override
  List<Object> get props => [];
}

class DemoCodeLoadedState extends DemoCodeState {
  final DemoCodeModel democodeModel;

  DemoCodeLoadedState({required this.democodeModel});

  @override
  List<Object> get props => [];
}

class DemoCodeErrorState extends DemoCodeState {
  String message;

  DemoCodeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

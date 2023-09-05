import 'package:equatable/equatable.dart';

class DemoCodeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchDemoCodeEvent extends DemoCodeEvent {
  final int values;

  FetchDemoCodeEvent(this.values);

  @override
  List<Object> get props => [];
}

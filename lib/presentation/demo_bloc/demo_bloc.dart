import 'package:bloc/bloc.dart';

import '../../domain/repositories/demo_repository.dart';
import 'demo_event.dart';
import 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoInitialState()) {
    on<DemoEvent>((event, emit) async {
      emit(DemoLoadingState());
      try {
        if (event is FetchDemoEvent) {
          print(event);
          var foodscreen = await Repository().getDemodetails();


          emit(DemoLoadedState(demoModel: foodscreen));
        }
      } catch (e) {
        emit(DemoErrorState(message: e.toString()));
      }
    });
  }
}

import 'package:bloc/bloc.dart';

import '../../domain/repositories/demo_repository.dart';
import 'demo_code_event.dart';
import 'demo_code_state.dart';

class DemoCodeBloc extends Bloc<DemoCodeEvent, DemoCodeState> {
  DemoCodeBloc() : super(DemoCodeInitialState()) {
    on<DemoCodeEvent>((event, emit) async {
      emit(DemoCodeLoadingState());
      try {
        if (event is FetchDemoCodeEvent) {
          print(event);
          var foodscreen = await Repository().getDemocodedetails(event.values);


          emit(DemoCodeLoadedState(democodeModel: foodscreen));
        }
      } catch (e) {
        emit(DemoCodeErrorState(message: e.toString()));
      }
    });
  }
}

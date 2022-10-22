import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_layout_event.dart';
part 'main_layout_state.dart';

class MainLayoutBloc extends Bloc<MainLayoutEvent, MainLayoutState> {
  MainLayoutBloc() : super(MainLayoutInitial()) {
    on<MainLayoutEvent>((event, emit) {
      // TODO: implement event handle
    });
  }
}

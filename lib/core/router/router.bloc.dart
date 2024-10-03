import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'router.event.dart';

part 'router.state.dart';

class MyRouterBloc extends Bloc<RouterEvent, MyRouterState> {
  MyRouterBloc() : super(const MyRouterState.initialState()) {
    on<RouterSetAuthorization>((event, emit) {
      emit(state.copyWith(isAuthorized: event.authorization));
    });
  }
}

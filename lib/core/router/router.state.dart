part of 'router.bloc.dart';

class MyRouterState extends Equatable {
  final bool isAuthorized;

  const MyRouterState({required this.isAuthorized});

  const MyRouterState.initialState() : isAuthorized = false;

  MyRouterState copyWith({bool? isAuthorized}) {
    return MyRouterState(isAuthorized: isAuthorized ?? this.isAuthorized);
  }

  @override
  List<Object> get props => [isAuthorized];
}

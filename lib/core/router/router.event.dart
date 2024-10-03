part of 'router.bloc.dart';

sealed class RouterEvent {
  const RouterEvent();
}

class RouterSetAuthorization extends RouterEvent {
  final bool authorization;
  RouterSetAuthorization({required this.authorization});
}

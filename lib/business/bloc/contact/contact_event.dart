import 'package:equatable/equatable.dart';

sealed class ContactEvent extends Equatable{}

class ContactGetAllEvent extends ContactEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
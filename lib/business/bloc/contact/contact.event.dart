import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/common/core/exception.error.dart';
import 'package:equatable/equatable.dart';

sealed class ContactEvent extends Equatable {}

/// GET ALL CONTACTS

class ContactGetAllStartEvent extends ContactEvent {
  ContactGetAllStartEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContactGetAllSuccessEvent extends ContactEvent {
  final List<ContactModel> contacts;

  ContactGetAllSuccessEvent({required this.contacts});

  @override
  // TODO: implement props
  List<Object?> get props => [ContactModel];
}

class ContactGetAllFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactGetAllFailedEvent({required this.errorRequestException});

  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/// GET CONTACT BY ROLE

class ContactGetByRoleStartEvent extends ContactEvent {
  final ContactRole role;

  ContactGetByRoleStartEvent({required this.role});

  @override
  // TODO: implement props
  List<Object?> get props => [role];
}

class ContactGetByRoleSuccessEvent extends ContactEvent {
  final ContactRole role;

  ContactGetByRoleSuccessEvent({required this.role});
  @override
  // TODO: implement props
  List<Object?> get props => [role];
}

class ContactGetByRoleFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactGetByRoleFailedEvent({required this.errorRequestException});
  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/// SET CURRENT USER

class ContactSetCurrentUserStartEvent extends ContactEvent {
  final String userId;

  ContactSetCurrentUserStartEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}

class ContactSetCurrentUserSuccessEvent extends ContactEvent {
  final ContactModel currentUser;

  ContactSetCurrentUserSuccessEvent({required this.currentUser});
  @override
  // TODO: implement props
  List<Object?> get props => [currentUser];
}

class ContactSetCurrentUserFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactSetCurrentUserFailedEvent({required this.errorRequestException});
  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/// RECEIVER CURRENT USER

class ContactResetCurrentUserStartEvent extends ContactEvent {
  ContactResetCurrentUserStartEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContactResetCurrentUserSuccessEvent extends ContactEvent {
  ContactResetCurrentUserSuccessEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContactResetCurrentUserFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactResetCurrentUserFailedEvent({required this.errorRequestException});
  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/*  SET MESSAGE RECEIVER  */

class ContactSetCurrentReceiverByIdStartEvent extends ContactEvent {
  final String receiverId;

  ContactSetCurrentReceiverByIdStartEvent({required this.receiverId});
  @override
  // TODO: implement props
  List<Object?> get props => [receiverId];
}

class ContactSetCurrentReceiverByIdSuccessEvent extends ContactEvent {
  final ContactModel receiver;

  ContactSetCurrentReceiverByIdSuccessEvent({required this.receiver});

  @override
  // TODO: implement props
  List<Object?> get props => [receiver];
}

class ContactSetCurrentReceiverByIdFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactSetCurrentReceiverByIdFailedEvent(
      {required this.errorRequestException});

  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/// RESET CURRENT USER

class ContactResetCurrentReceiverStartEvent extends ContactEvent {
  ContactResetCurrentReceiverStartEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContactResetCurrentReceiverSuccessEvent extends ContactEvent {
  ContactResetCurrentReceiverSuccessEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ContactResetCurrentReceiverFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactResetCurrentReceiverFailedEvent({required this.errorRequestException});
  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/common/core/exception.error.dart';

sealed class ContactEvent {}

/// GET ALL CONTACTS

class ContactGetAllStartEvent extends ContactEvent {
  ContactGetAllStartEvent();
}

class ContactGetAllSuccessEvent extends ContactEvent {
  final List<ContactModel> contacts;

  ContactGetAllSuccessEvent({required this.contacts});
}

class ContactGetAllFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactGetAllFailedEvent({required this.errorRequestException});
}

/// GET CONTACT BY ROLE

class ContactGetByRoleStartEvent extends ContactEvent {
  final ContactRole role;

  ContactGetByRoleStartEvent({required this.role});
}

class ContactGetByRoleSuccessEvent extends ContactEvent {
  final ContactRole role;

  ContactGetByRoleSuccessEvent({required this.role});
}

class ContactGetByRoleFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactGetByRoleFailedEvent({required this.errorRequestException});
}

/// GET CURRENT USER

class ContactSetCurrentUserStartEvent extends ContactEvent {
  final String userId;

  ContactSetCurrentUserStartEvent({required this.userId});
}

class ContactSetCurrentUserSuccessEvent extends ContactEvent {
  final ContactModel currentUser;

  ContactSetCurrentUserSuccessEvent({required this.currentUser});
}

class ContactSetCurrentUserFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactSetCurrentUserFailedEvent({required this.errorRequestException});
}

/*  SET MESSAGE RECEIVER  */

class ContactSetCurrentReceiverByIdStartEvent extends ContactEvent {
  final String receiverId;

  ContactSetCurrentReceiverByIdStartEvent({required this.receiverId});
}

class ContactSetCurrentReceiverByIdSuccessEvent extends ContactEvent {
  final ContactModel receiver;

  ContactSetCurrentReceiverByIdSuccessEvent({required this.receiver});
}

class ContactSetCurrentReceiverByIdFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactSetCurrentReceiverByIdFailedEvent(
      {required this.errorRequestException});
}

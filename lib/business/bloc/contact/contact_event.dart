import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/common/core/exception_error.dart';

sealed class ContactEvent {}

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

class ContactGetByRoleStartEvent extends ContactEvent {
  final ContactRole role;
  ContactGetByRoleStartEvent({required this.role});
}

class ContactGetByRoleSuccessEvent extends ContactEvent {
  final List<ContactModel> contacts;

  ContactGetByRoleSuccessEvent({required this.contacts});
}

class ContactGetByRoleFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;
  ContactGetByRoleFailedEvent({required this.errorRequestException});
}

import 'dart:io';

import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:contact_message_app/common/core/exception_error.dart';

sealed class ContactEvent {}

class ContactGetAllSuccessEvent extends ContactEvent {
  final List<ContactModel> contacts;

  ContactGetAllSuccessEvent({required this.contacts});
}

class ContactGetAllFailedEvent extends ContactEvent {
  final ErrorRequestException errorRequestException;

  ContactGetAllFailedEvent({required this.errorRequestException});
}

class ContactGetAllStartEvent extends ContactEvent {
  ContactGetAllStartEvent();
}

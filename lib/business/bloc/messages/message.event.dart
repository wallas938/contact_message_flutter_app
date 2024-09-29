import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/common/core/exception.error.dart';

sealed class MessageEvent {}

class MessageGetAllByContactIdStartEvent extends MessageEvent {
  final String contactId;

  MessageGetAllByContactIdStartEvent({required this.contactId});
}

class MessageGetAllByContactIdSuccessEvent extends MessageEvent {
  final List<MessageModel> messages;

  MessageGetAllByContactIdSuccessEvent({required this.messages});
}

class MessageGetAllByContactIdFailedEvent extends MessageEvent {
  final ErrorRequestException errorRequestException;

  MessageGetAllByContactIdFailedEvent({required this.errorRequestException});
}

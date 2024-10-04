import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/common/core/exception.error.dart';

sealed class MessageEvent {}

/// *  GET ALL MESSAGES BY CONTACT ID **

class MessageGetThreadStartEvent extends MessageEvent {
  final ContactConversationPair conversationData;

  MessageGetThreadStartEvent({required this.conversationData});
}

class MessageGetThreadSuccessEvent extends MessageEvent {
  final List<MessageModel> messages;

  MessageGetThreadSuccessEvent({required this.messages});
}

class MessageGetThreadFailedEvent extends MessageEvent {
  final ErrorRequestException errorRequestException;

  MessageGetThreadFailedEvent({required this.errorRequestException});
}

/// *  POST A MESSAGE

class MessagePostMessageStartEvent extends MessageEvent {
  MessageModel message;

  MessagePostMessageStartEvent({required this.message});
}

class MessagePostMessageSuccessEvent extends MessageEvent {
  MessageModel message;

  MessagePostMessageSuccessEvent({required this.message});
}

class MessagePostMessageFailedEvent extends MessageEvent {
  final ErrorRequestException errorRequestException;

  MessagePostMessageFailedEvent({required this.errorRequestException});
}

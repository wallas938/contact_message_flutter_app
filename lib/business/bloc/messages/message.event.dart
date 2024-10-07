import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/common/core/exception.error.dart';
import 'package:equatable/equatable.dart';

sealed class MessageEvent extends Equatable {}

/// *  GET ALL MESSAGES BY CONTACT ID **

class MessageGetThreadStartEvent extends MessageEvent {
  final ContactConversationPair conversationData;

  MessageGetThreadStartEvent({required this.conversationData});

  @override
  // TODO: implement props
  List<Object?> get props => [conversationData];
}

class MessageGetThreadSuccessEvent extends MessageEvent {
  final List<MessageModel> messages;

  MessageGetThreadSuccessEvent({required this.messages});

  @override
  // TODO: implement props
  List<Object?> get props => [messages];
}

class MessageGetThreadFailedEvent extends MessageEvent {
  final ErrorRequestException errorRequestException;

  MessageGetThreadFailedEvent({required this.errorRequestException});

  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

/// *  POST A MESSAGE

class MessagePostMessageStartEvent extends MessageEvent {
  final MessageModel message;

  MessagePostMessageStartEvent({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class MessagePostMessageSuccessEvent extends MessageEvent {
  final MessageModel message;

  MessagePostMessageSuccessEvent({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class MessagePostMessageFailedEvent extends MessageEvent {
  final ErrorRequestException errorRequestException;

  MessagePostMessageFailedEvent({required this.errorRequestException});

  @override
  // TODO: implement props
  List<Object?> get props => [errorRequestException];
}

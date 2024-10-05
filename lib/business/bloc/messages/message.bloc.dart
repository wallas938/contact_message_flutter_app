import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/business/repository/message/message/message.repository.dart';
import 'package:contact_message_app/common/core/exception.error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageState extends Equatable {
  final List<MessageModel> messages;
  final bool loading;
  final ErrorRequestException exception;

  const MessageState(
      {required this.messages, required this.loading, required this.exception});

  MessageState copyWith(
      {List<MessageModel>? messages,
      bool? loading,
      ErrorRequestException? exception}) {
    return MessageState(
        messages: messages ?? this.messages,
        loading: loading ?? this.loading,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [messages, loading, exception];
}

MessageState initialState = MessageState(
    messages: const [],
    loading: false,
    exception: ErrorRequestException.initialState());

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;

  MessageBloc(this.messageRepository) : super(initialState) {
    /* ------------- GET ALL MESSAGES BY CONTACT ID ---------------*/

    on<MessageGetThreadStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        List<MessageModel> payload =
            await messageRepository.getConversation(event.conversationData);
        add(MessageGetThreadSuccessEvent(messages: payload));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des messages",
            hasError: true);
        add(MessageGetThreadFailedEvent(errorRequestException: error));
      }
    });
    on<MessageGetThreadSuccessEvent>((event, emit) async {
      // if (kDebugMode) {
      //   print("Current Receiver: ${event.messages}");
      // }
      emit(state.copyWith(messages: event.messages, loading: false));
    });
    on<MessageGetThreadFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- GET ALL MESSAGES BY CONTACT ID ---------------*/

    on<MessagePostMessageStartEvent>((event, emit) {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        messageRepository.postMessage(event.message);

        add(MessagePostMessageSuccessEvent(message: event.message));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des messages",
            hasError: true);

        add(MessagePostMessageFailedEvent(errorRequestException: error));
      }
    });
    on<MessagePostMessageSuccessEvent>((event, emit) async {
      add(MessageGetThreadStartEvent(
          conversationData: ContactConversationPair(
              from: event.message.from, to: event.message.to)));
    });
    on<MessagePostMessageFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });
  }
}

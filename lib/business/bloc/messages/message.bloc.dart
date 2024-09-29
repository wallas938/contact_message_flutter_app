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

const MessageState initialState = MessageState(
    messages: [],
    loading: false,
    exception: ErrorRequestException(errorMessage: "", hasError: false));

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageRepository messageRepository;

  MessageBloc(this.messageRepository) : super(initialState) {
    /* ------------- GET ALL MESSAGES BY CONTACT ID ---------------*/

    on<MessageGetAllByContactIdStartEvent>((event, emit) async {
      const error = ErrorRequestException(errorMessage: "", hasError: false);
      emit(state.copyWith(loading: true, exception: error));
      try {
        List<MessageModel> payload =
            await messageRepository.getAllMessagesByContactId(event.contactId);
        add(MessageGetAllByContactIdSuccessEvent(messages: payload));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des messages",
            hasError: true);
        add(MessageGetAllByContactIdFailedEvent(errorRequestException: error));
      }
    });

    on<MessageGetAllByContactIdSuccessEvent>((event, emit) async {
      emit(state.copyWith(messages: event.messages, loading: false));
    });
    on<MessageGetAllByContactIdFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });
  }
}

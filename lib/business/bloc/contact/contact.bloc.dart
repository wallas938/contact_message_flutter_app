import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/repository/contact/contact.repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_message_app/common/core/exception.error.dart';

class ContactState extends Equatable {
  final List<ContactModel> contacts;
  final ContactRole contactRole;
  final ContactModel? currentUser;
  final ContactModel? receiver;
  final bool loading;
  final ErrorRequestException exception;

  const ContactState(
      {required this.currentUser,
      required this.contactRole,
      required this.receiver,
      required this.contacts,
      required this.loading,
      required this.exception});

  ContactState.initialState()
      : loading = false,
        exception = ErrorRequestException.initialState(),
        contactRole = ContactRole.contact,
        contacts = [],
        receiver = null,
        currentUser = null;

  ContactState copyWith(
      {ContactModel? currentUser,
      ContactModel? receiver,
      ContactRole? contactRole,
      List<ContactModel>? contacts,
      bool? loading,
      ErrorRequestException? exception}) {
    return ContactState(
        currentUser: currentUser ?? this.currentUser,
        contactRole: contactRole ?? this.contactRole,
        receiver: receiver ?? this.receiver,
        contacts: contacts ?? this.contacts,
        loading: loading ?? this.loading,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [contacts, loading, exception, currentUser];
}

class ContactConversationPair extends Equatable {
  final String from;
  final String to;

  const ContactConversationPair({required this.from, required this.to});

  @override
  // TODO: implement props
  List<Object?> get props => [from, to];
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(ContactState.initialState()) {
    /* ------------- CONTACTS ---------------*/

    on<ContactGetAllStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        List<ContactModel> payload = await contactRepository.getAllContacts();
        add(ContactGetAllSuccessEvent(contacts: payload));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des contacts",
            hasError: true);
        add(ContactGetAllFailedEvent(errorRequestException: error));
      }
    });
    on<ContactGetAllSuccessEvent>((event, emit) async {
      emit(state.copyWith(contacts: event.contacts, loading: false));
    });
    on<ContactGetAllFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- CURRENT USER ---------------*/

    on<ContactSetCurrentUserStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        ContactModel payload =
            await contactRepository.getContactById(event.userId);
        add(ContactSetCurrentUserSuccessEvent(currentUser: payload));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement du destinataire",
            hasError: true);
        add(ContactSetCurrentUserFailedEvent(errorRequestException: error));
      }
    });
    on<ContactSetCurrentUserSuccessEvent>((event, emit) async {
      emit(state.copyWith(currentUser: event.currentUser, loading: false));
    });
    on<ContactSetCurrentUserFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- SET CURRENT RECEIVER BY ID---------------*/

    on<ContactSetCurrentReceiverByIdStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        ContactModel payload =
            await contactRepository.getContactById(event.receiverId);
        if (kDebugMode) {
          print("Current Receiver: $payload");
        }
        add(ContactSetCurrentReceiverByIdSuccessEvent(receiver: payload));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des contacts par rôle",
            hasError: true);
        add(ContactSetCurrentReceiverByIdFailedEvent(
            errorRequestException: error));
      }
    });
    on<ContactSetCurrentReceiverByIdSuccessEvent>((event, emit) async {
      emit(state.copyWith(receiver: event.receiver, loading: false));
    });
    on<ContactSetCurrentReceiverByIdFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- GET CONTACTS BY ROLE---------------*/

    on<ContactGetByRoleStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true, exception: ErrorRequestException.initialState()));
      try {
        // List<ContactModel> payload =
        //     await contactRepository.getContactsByRole(event.role);
        add(ContactGetByRoleSuccessEvent(role: event.role));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des contacts par rôle",
            hasError: true);
        add(ContactGetByRoleFailedEvent(errorRequestException: error));
      }
    });
    on<ContactGetByRoleSuccessEvent>((event, emit) async {
      emit(state.copyWith(contactRole: event.role, loading: false));
    });
    on<ContactGetByRoleFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });
  }
}

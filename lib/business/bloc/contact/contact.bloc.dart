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
  final ContactModel currentUser;
  final ContactModel receiver;
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
        exception = const ErrorRequestException.initialState(),
        contactRole = ContactRole.contact,
        contacts = [],
        receiver = const ContactModel.initialReceiverState(),
        currentUser = const ContactModel.initialUserState();

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
  List<Object?> get props => [loading, receiver, currentUser];
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
          loading: true,
          exception: const ErrorRequestException.initialState()));
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

    /* ------------- SET CURRENT USER ---------------*/

    on<ContactSetCurrentUserStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true,
          exception: const ErrorRequestException.initialState()));
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

    /* ------------- RESET CURRENT USER ---------------*/

    on<ContactResetCurrentUserStartEvent>((event, emit) {
      emit(state.copyWith(
          loading: true,
          exception: const ErrorRequestException.initialState()));
      try {
        add(ContactResetCurrentUserSuccessEvent());
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors de la réinitialisation de l'utilisateur",
            hasError: true);
        add(ContactResetCurrentUserFailedEvent(errorRequestException: error));
      }
    });
    on<ContactResetCurrentUserSuccessEvent>((event, emit) {
      emit(state.copyWith(
          currentUser: const ContactModel.initialUserState(), loading: false));
      if (kDebugMode) {
        print(state.currentUser);
      }
    });
    on<ContactResetCurrentUserFailedEvent>((event, emit) {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- SET CURRENT RECEIVER BY ID---------------*/

    on<ContactSetCurrentReceiverByIdStartEvent>((event, emit) {
      emit(state.copyWith(
          loading: true,
          exception: const ErrorRequestException.initialState()));
      try {
        if (kDebugMode) {
          print("Current Receiver: ${event.receiver}");
        }
        add(ContactSetCurrentReceiverByIdSuccessEvent(receiver: event.receiver));
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement des contacts par rôle",
            hasError: true);
        add(ContactSetCurrentReceiverByIdFailedEvent(
            errorRequestException: error));
      }
    });
    on<ContactSetCurrentReceiverByIdSuccessEvent>((event, emit) {
      emit(state.copyWith(receiver: event.receiver, loading: false));
    });
    on<ContactSetCurrentReceiverByIdFailedEvent>((event, emit) {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- RESET CURRENT RECEIVER ---------------*/

    on<ContactResetCurrentReceiverStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true,
          exception: const ErrorRequestException.initialState()));
      try {
        add(ContactResetCurrentReceiverSuccessEvent());
      } on Exception {
        const error = ErrorRequestException(
            errorMessage: "Erreur lors du chargement du destinataire",
            hasError: true);
        add(ContactResetCurrentReceiverFailedEvent(
            errorRequestException: error));
      }
    });
    on<ContactResetCurrentReceiverSuccessEvent>((event, emit) async {
      emit(state.copyWith(receiver: null, loading: false));
    });
    on<ContactResetCurrentReceiverFailedEvent>((event, emit) async {
      emit(
        state.copyWith(loading: false, exception: event.errorRequestException),
      );
    });

    /* ------------- GET CONTACTS BY ROLE---------------*/

    on<ContactGetByRoleStartEvent>((event, emit) async {
      emit(state.copyWith(
          loading: true,
          exception: const ErrorRequestException.initialState()));
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

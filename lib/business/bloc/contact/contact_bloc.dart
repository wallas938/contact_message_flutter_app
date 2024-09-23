import 'package:contact_message_app/business/bloc/contact/contact_event.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/business/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_message_app/common/core/exception_error.dart';

class ContactState extends Equatable {
  final List<ContactModel> contacts;
  final bool loading;
  final ErrorRequestException exception;

  const ContactState(
      {required this.contacts, required this.loading, required this.exception});

  ContactState copyWith(
      {List<ContactModel>? contacts,
      bool? loading,
      ErrorRequestException? exception}) {
    return ContactState(
        contacts: contacts ?? this.contacts,
        loading: loading ?? this.loading,
        exception: exception ?? this.exception);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [contacts, loading, exception];
}

const ContactState initialState = ContactState(
    contacts: [],
    loading: false,
    exception: ErrorRequestException(errorMessage: "", hasError: false));

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(initialState) {
    on<ContactGetAllStartEvent>((event, emit) async {
      const error = ErrorRequestException(errorMessage: "", hasError: false);
      emit(state.copyWith(loading: true, exception: error));
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
  }
}

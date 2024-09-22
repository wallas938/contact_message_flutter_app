import 'package:contact_message_app/business/bloc/contact/contact_event.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/data/repository/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactState extends Equatable {
  final List<ContactModel> contacts;

  const ContactState({
    required this.contacts,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [contacts];
}

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository)
      : super(const ContactState(contacts: [])) {
    on<ContactGetAllEvent>((event, emit) async {
      List<ContactModel> payload = await contactRepository.getAllContacts();
      emit(ContactState(contacts: payload));
    });
  }
}

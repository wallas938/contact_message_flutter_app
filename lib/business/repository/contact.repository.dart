import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';

abstract class ContactRepository {

  Future<List<ContactModel>> getAllContacts();
  Future<List<ContactModel>> getContactsByRole(ContactRole role);
}
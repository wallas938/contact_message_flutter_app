import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';

abstract class ContactDataProvider {
  Future<List<ContactModel>> getAllContacts();
  Future<List<ContactModel>> getContactsByRole(ContactRole role);
}
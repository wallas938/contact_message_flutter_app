import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';

abstract class ContactDataProvider {
  Future<List<ContactModel>> getAllContacts();
  Future<List<ContactModel>> getContactsByRole(ContactRole role);
  Future<ContactModel> getContactById(String userId);
}
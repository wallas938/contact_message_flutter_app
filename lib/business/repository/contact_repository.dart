import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';

abstract class ContactRepository {

  Future<List<ContactModel>> getAllContacts();
  Future<List<ContactModel>> getContactsByRole(ContactRole role);
}
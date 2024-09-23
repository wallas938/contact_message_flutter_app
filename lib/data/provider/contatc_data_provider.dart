import 'package:contact_message_app/business/models/contact/contact_model.dart';

abstract class ContactDataProvider {
  Future<List<ContactModel>> getAllContacts();
}
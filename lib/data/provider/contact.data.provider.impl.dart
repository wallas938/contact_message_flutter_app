import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/data/provider/contact.data.provider.dart';

class ContactDataProviderImpl extends ContactDataProvider {
  @override
  Future<List<ContactModel>> getAllContacts() async {
    return await Database().contacts;
  }

  @override
  Future<List<ContactModel>> getContactsByRole(ContactRole role) async {
    return role == ContactRole.student
        ? await Database().students
        : await Database().developers;
  }
}

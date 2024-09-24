import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/data/database/database_data.dart';
import 'package:contact_message_app/data/provider/contatc_data_provider.dart';

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

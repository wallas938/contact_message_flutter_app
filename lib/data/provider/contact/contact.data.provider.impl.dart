import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/data/provider/contact/contact.data.provider.dart';
import 'package:get_it/get_it.dart';

class ContactDataProviderImpl extends ContactDataProvider {
  @override
  Future<List<ContactModel>> getAllContacts() async {
    return await GetIt.instance<Database>().contacts;
  }

  @override
  Future<List<ContactModel>> getContactsByRole(ContactRole role) async {
    return role == ContactRole.student
        ? GetIt.instance<Database>().students
        : GetIt.instance<Database>().developers;
  }

  @override
  Future<ContactModel> getContactById(String userId) async {
    return GetIt.instance<Database>().getContactById(userId);
  }
}

import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/data/database/database_data.dart';
import 'package:contact_message_app/data/provider/contatc_data_provider.dart';

class ContactDataProviderImpl extends ContactDataProvider {
  @override
  Future<List<ContactModel>> getAllContacts() async {
    return await Database().contacts;
  }
}

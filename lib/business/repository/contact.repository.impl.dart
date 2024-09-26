import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/repository/contact.repository.dart';
import 'package:contact_message_app/data/provider/contact.data.provider.impl.dart';
import 'package:contact_message_app/data/provider/contact.data.provider.dart';
import 'package:get_it/get_it.dart';

class ContactRepositoryImpl extends ContactRepository {
  final ContactDataProvider contactDataProvider =
      GetIt.instance<ContactDataProviderImpl>();

  ContactRepositoryImpl();

  @override
  Future<List<ContactModel>> getAllContacts() async {
    return await contactDataProvider.getAllContacts();
  }

  @override
  Future<List<ContactModel>> getContactsByRole(ContactRole role) async {
    return await contactDataProvider.getContactsByRole(role);
  }
}

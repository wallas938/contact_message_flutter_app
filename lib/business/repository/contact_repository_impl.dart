import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/business/repository/contact_repository.dart';
import 'package:contact_message_app/data/provider/contatc_data_provider.dart';

class ContactRepositoryImpl extends ContactRepository {

  final ContactDataProvider contactDataProvider;

  ContactRepositoryImpl({required this.contactDataProvider});

  @override
  Future<List<ContactModel>> getAllContacts() async{
    return await contactDataProvider.getAllContacts();
  }
}
import 'package:contact_message_app/business/models/contact/contact_enum.dart';

class ContactModel {
  String name;
  String scores;
  ContactRole role;

  ContactModel({required this.name, required this.scores, required this.role});
}

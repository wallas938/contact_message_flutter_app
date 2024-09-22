import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';

List<ContactModel> contacts = [
  const ContactModel(
      name: "Mohammed", profile: "MO", scores: 58, role: ContactRole.developer),
  const ContactModel(
      name: "Patrick", profile: "PA", scores: 58, role: ContactRole.student),
  const ContactModel(
      name: "Sylvie", profile: "SY", scores: 58, role: ContactRole.developer),
  const ContactModel(
      name: "Aboubakar",
      profile: "AB",
      scores: 58,
      role: ContactRole.developer),
  const ContactModel(
      name: "Lassana", profile: "LA", scores: 58, role: ContactRole.student),
  const ContactModel(
      name: "Pierre", profile: "PI", scores: 58, role: ContactRole.student),
];

class Database {
  final List<ContactModel> _contacts = [
    const ContactModel(
        name: "Mohammed",
        profile: "MO",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        name: "Patrick", profile: "PA", scores: 58, role: ContactRole.student),
    const ContactModel(
        name: "Sylvie", profile: "SY", scores: 58, role: ContactRole.developer),
    const ContactModel(
        name: "Aboubakar",
        profile: "AB",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        name: "Lassana", profile: "LA", scores: 58, role: ContactRole.student),
    const ContactModel(
        name: "Pierre", profile: "PI", scores: 58, role: ContactRole.student),
  ];

  Future<List<ContactModel>> get contacts async => Future.delayed(
        const Duration(seconds: 1),
        () => _contacts,
      ); //
}

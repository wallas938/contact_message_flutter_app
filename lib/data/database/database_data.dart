import 'dart:math';

import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:contact_message_app/business/models/contact/contact_model.dart';

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

  Future<List<ContactModel>> get contacts async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    print(randomNumber);
    return Future.delayed(const Duration(milliseconds: 2500),
        () => randomNumber >= 2 ? _contacts : throw Exception("Erreur Test"));
  } //

  Future<List<ContactModel>> get students async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    print("students");
    return Future.delayed(
        const Duration(milliseconds: 2500),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.student).toList()
            : throw Exception("Erreur Test"));
  } //

  Future<List<ContactModel>> get developers async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    print("developers");
    return Future.delayed(
        const Duration(milliseconds: 2500),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.developer).toList()
            : throw Exception("Erreur Test"));
  } //
}

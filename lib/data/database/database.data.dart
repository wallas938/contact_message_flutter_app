import 'dart:math';

import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class Database {
  final List<ContactModel> _contacts = [
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Mohammed",
        profile: "MO",
        scores: 58,
        role: ContactRole.developer),
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Patrick",
        profile: "PA",
        scores: 58,
        role: ContactRole.student),
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Sylvie",
        profile: "SY",
        scores: 58,
        role: ContactRole.developer),
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Aboubakar",
        profile: "AB",
        scores: 58,
        role: ContactRole.developer),
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Lassana",
        profile: "LA",
        scores: 58,
        role: ContactRole.student),
    ContactModel(
        id: GetIt.instance<UuidV4>().generate(),
        name: "Pierre",
        profile: "PI",
        scores: 58,
        role: ContactRole.student),
  ];

  Future<List<ContactModel>> get contacts async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(const Duration(milliseconds: 2500),
        () => randomNumber >= 2 ? _contacts : throw Exception("Erreur Test"));
  } //

  Future<List<ContactModel>> get students async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(
        const Duration(milliseconds: 2500),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.student).toList()
            : throw Exception("Erreur Test"));
  } //

  Future<List<ContactModel>> get developers async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(
        const Duration(milliseconds: 2500),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.developer).toList()
            : throw Exception("Erreur Test"));
  } //
}

import 'dart:math';

import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class Database {
  /// *   Contact Data    **

  final List<ContactModel> _contacts = [
    const ContactModel(
        id: "1",
        name: "Mohammed",
        profile: "MO",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        id: "2",
        name: "Patrick",
        profile: "PA",
        scores: 58,
        role: ContactRole.student),
    const ContactModel(
        id: "3",
        name: "Sylvie",
        profile: "SY",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        id: "4",
        name: "Aboubakar",
        profile: "AB",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        id: "5",
        name: "Lassana",
        profile: "LA",
        scores: 58,
        role: ContactRole.student),
    const ContactModel(
        id: "6",
        name: "Pierre",
        profile: "PI",
        scores: 58,
        role: ContactRole.student),
  ];
  final List<MessageModel> _messages = [
    MessageModel(
        id: "1",
        content:
            "Message de Mohamed On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).",
        date: DateTime.now(),
        from: "1",
        to: "2"),
    MessageModel(
        id: "2",
        content:
            "Message de Patrickc On sait depuis longtemps que travailler avec du texte lisible et contenant du sens est source de distractions, et empêche de se concentrer sur la mise en page elle-même. L'avantage du Lorem Ipsum sur un texte générique comme 'Du texte. Du texte. Du texte.' est qu'il possède une distribution de lettres plus ou moins normale, et en tout cas comparable avec celle du français standard. De nombreuses suites logicielles de mise en page ou éditeurs de sites Web ont fait du Lorem Ipsum leur faux texte par défaut, et une recherche pour 'Lorem Ipsum' vous conduira vers de nombreux sites qui n'en sont encore qu'à leur phase de construction. Plusieurs versions sont apparues avec le temps, parfois par accident, souvent intentionnellement (histoire d'y rajouter de petits clins d'oeil, voire des phrases embarassantes).",
        date: DateTime.now(),
        from: "2",
        to: "1"),
    MessageModel(
        id: "3",
        content: "Message de Sylvie",
        date: DateTime.now(),
        from: "3",
        to: "4"),
    MessageModel(
        id: "4",
        content: "Message de Aboubakar",
        date: DateTime.now(),
        from: "4",
        to: "3"),
    MessageModel(
        id: "5",
        content: "Message de Lassana",
        date: DateTime.now(),
        from: "5",
        to: "6"),
    MessageModel(
        id: "6",
        content: "Message de Pierre",
        date: DateTime.now(),
        from: "6",
        to: "5"),
  ];

  Future<List<ContactModel>> get contacts async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(const Duration(milliseconds: 1000),
        () => randomNumber >= 2 ? _contacts : throw Exception("Erreur Test"));
  }

  Future<List<ContactModel>> get students async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(
        const Duration(milliseconds: 1000),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.student).toList()
            : throw Exception("Erreur Test"));
  }

  Future<List<ContactModel>> get developers async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(
        const Duration(milliseconds: 1000),
        () => randomNumber >= 2
            ? _contacts.where((c) => c.role == ContactRole.developer).toList()
            : throw Exception("Erreur Test"));
  }

  Future<ContactModel> getContactById(String userId) async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);

    return Future.delayed(
        const Duration(milliseconds: 0),
            () => randomNumber >= 2
            ? _contacts
            .firstWhere((c) => userId == c.id)
            : throw Exception("Erreur Test"));
  }

  /// *   Message Data    **

  Future<List<MessageModel>> getMessagesByContactId(String contactId) async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);

    return Future.delayed(
        const Duration(milliseconds: 0),
        () => randomNumber >= 2
            ? _messages
                .where((m) => contactId == m.to || contactId == m.from)
                .toList()
            : throw Exception("Erreur Test"));
  }
}

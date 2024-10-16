import 'dart:math';

import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';

class Database {
  /// *   Contact Data    **

  final List<ContactModel> _contacts = [
    const ContactModel(
        id: "1",
        name: "Alice",
        profile: "AL",
        scores: 12,
        role: ContactRole.student),
    const ContactModel(
        id: "2",
        name: "Bob",
        profile: "BO",
        scores: 82,
        role: ContactRole.developer),
    const ContactModel(
        id: "3",
        name: "Claire",
        profile: "CL",
        scores: 77,
        role: ContactRole.developer),
    const ContactModel(
        id: "4",
        name: "David",
        profile: "DA",
        scores: 21,
        role: ContactRole.developer),
    const ContactModel(
        id: "5",
        name: "Emma",
        profile: "EM",
        scores: 30,
        role: ContactRole.developer),
    const ContactModel(
        id: "6",
        name: "Frank",
        profile: "FR",
        scores: 41,
        role: ContactRole.developer),
    const ContactModel(
        id: "7",
        name: "George",
        profile: "GE",
        scores: 8,
        role: ContactRole.student),
    const ContactModel(
        id: "8",
        name: "Hannah",
        profile: "HA",
        scores: 47,
        role: ContactRole.student),
    const ContactModel(
        id: "9",
        name: "Ian",
        profile: "IA",
        scores: 58,
        role: ContactRole.developer),
    const ContactModel(
        id: "10",
        name: "Julia",
        profile: "JU",
        scores: 18,
        role: ContactRole.student),
  ];

  final List<MessageModel> _messages = [
    // Conversation entre Alice (ID: "1") et Bob (ID: "2")
    MessageModel(
        id: "1",
        content: "Bonjour Bob, as-tu terminé le rapport mensuel ?",
        date: DateTime.now(),
        from: "1",
        to: "2"),
    MessageModel(
        id: "2",
        content: "Salut Alice, je suis en train de le finaliser.",
        date: DateTime.now(),
        from: "2",
        to: "1"),
    // Conversation entre Claire (ID: "3") et David (ID: "4")
    MessageModel(
        id: "3",
        content: "David, peux-tu me confirmer notre rendez-vous de demain ?",
        date: DateTime.now(),
        from: "3",
        to: "4"),
    MessageModel(
        id: "4",
        content: "Oui Claire, c'est bien à 14h au bureau.",
        date: DateTime.now(),
        from: "4",
        to: "3"),
    // Conversation entre Emma (ID: "5") et Frank (ID: "6")
    MessageModel(
        id: "5",
        content: "Frank, as-tu reçu les dernières directives du client ?",
        date: DateTime.now(),
        from: "5",
        to: "6"),
    MessageModel(
        id: "6",
        content: "Oui Emma, je te les transfère immédiatement.",
        date: DateTime.now(),
        from: "6",
        to: "5"),
    // Conversation entre George (ID: "7") et Hannah (ID: "8")
    MessageModel(
        id: "7",
        content: "Hannah, n'oublie pas notre présentation cet après-midi.",
        date: DateTime.now(),
        from: "7",
        to: "8"),
    MessageModel(
        id: "8",
        content: "Merci George, je suis en train de me préparer.",
        date: DateTime.now(),
        from: "8",
        to: "7"),
    // Conversation entre Ian (ID: "9") et Julia (ID: "10")
    MessageModel(
        id: "9",
        content: "Julia, peux-tu revoir le design de la page d'accueil ?",
        date: DateTime.now(),
        from: "9",
        to: "10"),
    MessageModel(
        id: "10",
        content: "Bien sûr Ian, je te l'envoie dès que possible.",
        date: DateTime.now(),
        from: "10",
        to: "9"),
  ];

  Future<List<ContactModel>> get contacts async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);
    return Future.delayed(const Duration(milliseconds: 1000),
        () => randomNumber >= 0 ? _contacts : throw Exception("Erreur Test"));
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
        () => randomNumber >= 0
            ? _contacts.firstWhere((c) => userId == c.id)
            : throw Exception("Erreur Test"));
  }

  /// *   Message Data    **
  Future<List<MessageModel>> getConversation(
      ContactConversationPair conversationData) async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);

    return Future.delayed(
        const Duration(milliseconds: 0),
        () => randomNumber >= 0
            ? _messages
                .where((m) =>
                    (conversationData.from == m.from ||
                        conversationData.from == m.to) &&
                    (conversationData.to == m.from ||
                        conversationData.to == m.to))
                .toList()
            : throw Exception("Erreur Test"));
  }

  Future<MessageModel> postMessage(MessageModel message) async {
    Random random = Random();
    int randomNumber = 0 + random.nextInt(10 - 0);

    await Future.delayed(
        const Duration(milliseconds: 0),
        () => randomNumber >= 0
            ? _messages.add(message)
            : throw Exception("Erreur Test"));

    return message;
  }
}

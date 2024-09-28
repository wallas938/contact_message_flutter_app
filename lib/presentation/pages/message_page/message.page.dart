import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/message/message.drawer.widget.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/message/message.header.widget.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/message/message.list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<ContactModel> contactsTest = [
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
List<MessageModel> messagesTest = [
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

class MessagePage extends StatelessWidget {
  final String contactId;

  const MessagePage({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 80,
            title: BlocBuilder<ContactBloc, ContactState>( //ContactBloc => MessageBloc
              builder: (context, state) {
                return MessageHeaderWidget(profile: contactsTest.firstWhere((e) => contactId == e.id).profile,);
              },
            ),
            backgroundColor: Colors.white,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          drawer: MessageDrawerWidget(userId: contactId, contacts: contactsTest,),
          body: BlocBuilder<ContactBloc, ContactState>( //ContactBloc => MessageBloc
            builder: (context, state) {
              return MessageListWidget(messages: messagesTest, contactId: contactId);
            },
          )),
    );
  }
}

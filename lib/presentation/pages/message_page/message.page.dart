import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

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
      content: "Message de Mohamed",
      date: DateTime.now(),
      from: "1",
      to: "2"),
  MessageModel(
      id: "2",
      content: "Message de Patrick",
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
          drawer: Drawer(
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                List<ContactModel> contacts = state.contacts.toList();
                return Column(
                  children: [
                    const DrawerHeader(
                        padding: EdgeInsets.only(top: 50),
                        child: Text("Y O U R   C O N T A C T S")),
                    Expanded(
                      child: ListView.builder(
                          itemCount: contactsTest.length,
                          padding: const EdgeInsets.only(left: 30),
                          itemBuilder: (context, index) {
                            return ListTile(
                              iconColor: Colors.deepOrange,
                              trailing: const Icon(Icons.message),
                              title: Text(contactsTest[index].name),
                              subtitle: Text(contactsTest[index].role.name),
                            );
                          }),
                    ),
                  ],
                );
              },
            ),
          ),
          body: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return Center(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.purpleAccent),
                  width: 500,
                  child: ListView.builder(
                      itemCount: messagesTest.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: messagesTest[index].from == "3"
                              ? MainAxisAlignment.end
                              : MainAxisAlignment.start,
                          children: [
                            Text(messagesTest[index].content),
                          ],
                        );
                      }),
                ),
              );
            },
          )),
    );
  }
}

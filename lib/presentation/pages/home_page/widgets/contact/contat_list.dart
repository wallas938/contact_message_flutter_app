import 'package:contact_message_app/business/models/contact/contact_model.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contact_item.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  final List<ContactModel> contacts;

  const ContactList({required this.contacts, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ContactItem(
            name: contacts[index].name,
            profile: contacts[index].profile,
            scores: contacts[index].scores,
            role: contacts[index].role);
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Theme.of(context).hintColor,
          height: 1,
        );
      },
      itemCount: contacts.length,
    );
  }
}

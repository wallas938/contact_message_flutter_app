import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ContactItem extends StatelessWidget {
  final ContactModel contact;

  final TextStyle styleBase = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);

  const ContactItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        GoRouter.of(context).go('/messages/${contact.id}');
      },
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.white, width: 1)),
        child: Text(contact.profile, style: styleBase.copyWith(fontSize: 8)),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.role.name),
      trailing: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.deepOrange,
        child: Text(contact.scores.toString(), style: styleBase),
      ),
    );
  }
}

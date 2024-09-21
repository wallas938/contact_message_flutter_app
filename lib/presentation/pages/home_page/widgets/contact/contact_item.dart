import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String profile;
  final int scores;
  final ContactRole role;

  const ContactItem(
      {super.key,
      required this.name,
      required this.profile,
      required this.scores,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(profile),
      title: Text(name),
      subtitle: Text(role.name),
      trailing: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.deepOrange,
        child: Text(scores.toString(),
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
      ),
    );
  }
}

import 'package:contact_message_app/business/models/contact/contact_enum.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String profile;
  final int scores;
  final ContactRole role;

  final TextStyle styleBase = const TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white);

  const ContactItem(
      {super.key,
      required this.name,
      required this.profile,
      required this.scores,
      required this.role});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(color: Colors.white, width: 1)),
        child: Text(profile, style: styleBase.copyWith(fontSize: 8)),
      ),
      title: Text(name),
      subtitle: Text(role.name),
      trailing: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.deepOrange,
        child: Text(scores.toString(), style: styleBase),
      ),
    );
  }
}

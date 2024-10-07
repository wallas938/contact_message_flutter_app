import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactReceiverItemWidget extends StatelessWidget {
  final ContactModel receiver;
  final bool isSelected;
  const ContactReceiverItemWidget({super.key, required this.receiver, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.read<ContactBloc>().add(
            ContactSetCurrentReceiverByIdStartEvent(
                receiverId: receiver.id));
      },
      selectedTileColor: isSelected
          ? Colors.redAccent
          : Colors.black,
      textColor: isSelected
          ? Colors.redAccent
          : Colors.black,
      focusColor: isSelected
          ? Colors.redAccent
          : Colors.black,
      style: ListTileStyle.drawer,
      iconColor: isSelected
          ? Colors.redAccent
          : Colors.deepOrange,
      trailing: const Icon(Icons.message),
      title: Text(receiver.name),
      subtitle: Text(receiver.role.name),
    );
  }
}

import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactReceiverItemWidget extends StatefulWidget {
  final ContactModel receiver;

  const ContactReceiverItemWidget({super.key, required this.receiver});

  @override
  State<ContactReceiverItemWidget> createState() =>
      _ContactReceiverItemWidgetState();
}

class _ContactReceiverItemWidgetState extends State<ContactReceiverItemWidget> {
  late bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactBloc, ContactState>(
      builder: (context, state) {
        return ListTile(
          onTap: () {
            context.read<ContactBloc>().add(
                ContactSetCurrentReceiverByIdStartEvent(
                    receiver: widget.receiver));
          },
          selectedTileColor: isSelected ? Colors.redAccent : Colors.black,
          textColor: isSelected ? Colors.redAccent : Colors.black,
          focusColor: isSelected ? Colors.redAccent : Colors.black,
          style: ListTileStyle.drawer,
          iconColor: isSelected ? Colors.redAccent : Colors.deepOrange,
          trailing: const Icon(Icons.message),
          title: Text(widget.receiver.name),
          subtitle: Text(widget.receiver.role.name),
        );
      },
      listener: (BuildContext context, ContactState state) {
        isSelected = state.receiver.id == widget.receiver.id ? true : false;
      },
    );
  }
}

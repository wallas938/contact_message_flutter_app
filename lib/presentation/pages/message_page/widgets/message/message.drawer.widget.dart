import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/common/mixin/user.identifier.mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageDrawerWidget extends StatelessWidget with UserIdentifierMixin{
  final List<ContactModel> contacts; // Variable temporaire
  final String userId;

  const MessageDrawerWidget({super.key, required this.contacts, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.only(top: 50),
              child: Text("Y O U R   C O N T A C T S")),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                padding: const EdgeInsets.only(left: 30),
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: !isCurrentUser(userId, contacts[index]),
                    child: BlocBuilder<ContactBloc, ContactState>(
                      builder: (context, state) {
                        return ListTile(
                          onTap: (){
                            context.read<ContactBloc>().add(ContactSetCurrentReceiverByIdStartEvent(receiverId: contacts[index].id));
                          },
                          selectedTileColor: contacts[index].id == state.receiver?.id ? Colors.blue : Colors.black,
                          textColor: contacts[index].id == state.receiver?.id ? Colors.blue : Colors.black,
                          focusColor: contacts[index].id == state.receiver?.id ? Colors.blue : Colors.black,
                          style: ListTileStyle.drawer,
                          iconColor: contacts[index].id == state.receiver?.id ? Colors.blue : Colors.deepOrange,
                          trailing: const Icon(Icons.message),
                          title: Text(contacts[index].name),
                          subtitle: Text(contacts[index].role.name),
                        );
                      }
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/common/mixin/user.identifier.mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageDrawerWidget extends StatelessWidget with UserIdentifierMixin {
  final List<ContactModel> receivers;
  final String userId;

  const MessageDrawerWidget(
      {super.key, required this.receivers, required this.userId});

  @override
  Widget build(BuildContext context) {
    if (context.select((ContactBloc c) => c.state.receiver) == null) {
      context.read<ContactBloc>().add(
          ContactSetCurrentReceiverByIdStartEvent(receiverId: receivers[0].id));
    }
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              padding: EdgeInsets.only(top: 50),
              child: Text("Y O U R   C O N T A C T S")),
          Expanded(
            child: ListView.builder(
                itemCount: receivers.length,
                padding: const EdgeInsets.only(left: 30),
                itemBuilder: (context, index) {
                  return Visibility(
                    visible: !isCurrentUser(userId, receivers[index]),
                    child: BlocConsumer<ContactBloc, ContactState>(
                        listener: (context, state) {
                      if (state.receiver?.id == receivers[index].id) {
                        context.read<MessageBloc>().add(
                            MessageGetThreadStartEvent(
                                conversationData: ContactConversationPair(
                                    from: userId, to: state.receiver!.id)));
                      }
                    }, builder: (context, state) {
                      return ListTile(
                        onTap: () {
                          context.read<ContactBloc>().add(
                              ContactSetCurrentReceiverByIdStartEvent(
                                  receiverId: receivers[index].id));
                        },
                        selectedTileColor:
                            receivers[index].id == state.receiver?.id
                                ? Colors.redAccent
                                : Colors.black,
                        textColor: receivers[index].id == state.receiver?.id
                            ? Colors.redAccent
                            : Colors.black,
                        focusColor: receivers[index].id == state.receiver?.id
                            ? Colors.redAccent
                            : Colors.black,
                        style: ListTileStyle.drawer,
                        iconColor: receivers[index].id == state.receiver?.id
                            ? Colors.redAccent
                            : Colors.deepOrange,
                        trailing: const Icon(Icons.message),
                        title: Text(receivers[index].name),
                        subtitle: Text(receivers[index].role.name),
                      );
                    }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/common/mixin/user.identifier.mixin.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contact.receiver.item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactReceiverListWidget extends StatelessWidget
    with UserIdentifierMixin {
  final List<ContactModel> receivers;
  final String userId;

  const ContactReceiverListWidget(
      {super.key, required this.receivers, required this.userId});

  bool isReceiverSelected(int index, ContactModel? currentReceiver) {
    return receivers[index].id == currentReceiver?.id;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: receivers.length,
        padding: const EdgeInsets.only(left: 30),
        itemBuilder: (context, index) {
          return Visibility(
            visible: !isCurrentUser(userId, receivers[index]),
            child: BlocConsumer<ContactBloc, ContactState>(
                listener: (context, state) {
              if (state.receiver.id == receivers[index].id) {
                context.read<MessageBloc>().add(MessageGetThreadStartEvent(
                    conversationData: ContactConversationPair(
                        from: userId, to: state.receiver.id)));
              }
            }, builder: (context, state) {
              // isReceiverSelected(index, state.receiver)
              return ContactReceiverItemWidget(
                receiver: receivers[index],
                isSelected: isReceiverSelected(index, state.receiver),
              );
            }),
          );
        });
  }
}

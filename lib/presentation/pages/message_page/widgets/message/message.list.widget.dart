import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.form.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageListWidget extends StatelessWidget {
  final List<MessageModel> messages;
  final String contactId;

  const MessageListWidget(
      {super.key, required this.messages, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              if (state.loading) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state.exception.hasError) {
                return Expanded(
                    child: Center(child: Text(state.exception.errorMessage)));
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return MessageItemWidget(
                        message: messages[index],
                        userId: contactId,
                      );
                    }),
              );
            },
          ),
          SizedBox(
            height: 250,
            child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                return MessageFormWidget(
                  userId: contactId,
                  receiverId: state.receiver.id,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

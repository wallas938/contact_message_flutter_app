import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.item.widget.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  final List<MessageModel> messages;
  final String contactId;
  const MessageListWidget({super.key, required this.messages, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width / 1.3,
        child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return MessageItemWidget(message: messages[index], userId: contactId,);
            }),
      ),
    );
  }
}

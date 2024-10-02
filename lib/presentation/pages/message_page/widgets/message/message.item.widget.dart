import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:flutter/material.dart';

class MessageItemWidget extends StatelessWidget {

  final MessageModel message;
  final String userId;

  const MessageItemWidget({super.key, required this.message, required this.userId});

  bool isUserSender(String userId, String from) {
    return from == userId;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      isUserSender(userId, message.from)
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Visibility(
            visible: isUserSender(userId, message.from),
            child: const SizedBox(
              width: 50,
            )),
        Flexible(
            child: Card(
                color:
                isUserSender(userId, message.from)
                    ? Colors.green
                    : Colors.deepOrange,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 8),
                    child: Text(
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        message.content)))),
        Visibility(
            visible:
            !isUserSender(userId, message.from),
            child: const SizedBox(
              width: 50,
            )),
      ],
    );
  }
}

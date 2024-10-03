import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.item.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  final List<MessageModel> messages;
  final String contactId;

  const MessageListWidget(
      {super.key, required this.messages, required this.contactId});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageItemWidget(
                    message: messages[index],
                    userId: contactId,
                  );
                }),
          ),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(18),
                hintText: "Entrez votre message",
                label: Text("Message:"),
                suffix: Icon(Icons.message_outlined),
                suffixIconColor: Colors.deepOrange),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  if (kDebugMode) {
                    print("NOT EMPTY");
                  }
                }
              },
              style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.deepOrange),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  backgroundColor: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 50)),
              child: const Text(
                "Envoyer",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
        ],
      ),
    );
  }
}

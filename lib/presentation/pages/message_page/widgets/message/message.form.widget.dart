import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class MessageFormWidget extends StatelessWidget {
  final String receiverId;
  final String userId;

  const MessageFormWidget(
      {super.key, required this.receiverId, required this.userId});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
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
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<MessageBloc, MessageState>(
              builder: (context, state) {
                return TextButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        if (kDebugMode) {
                          context.read<MessageBloc>().add(
                              MessagePostMessageStartEvent(
                                  message: MessageModel(
                                      id: GetIt.instance<UuidV4>().generate(),
                                      content: controller.text,
                                      date: DateTime.now(),
                                      from: userId,
                                      to: receiverId)));
                        }
                      }
                    },
                    style: TextButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.deepOrange),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 24)),
                    child: const Text(
                      "Envoyer",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}

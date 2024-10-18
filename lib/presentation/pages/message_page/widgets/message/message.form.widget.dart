import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/business/models/message/message.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/v4.dart';

class MessageFormWidget extends StatefulWidget {
  final String receiverId;
  final String userId;

  const MessageFormWidget(
      {super.key, required this.receiverId, required this.userId});

  @override
  State<MessageFormWidget> createState() => _MessageFormWidgetState();
}

class _MessageFormWidgetState extends State<MessageFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ContactModel currentReceiver = context.read<ContactBloc>().state.receiver;
    TextEditingController controller = TextEditingController();
    String? errorText = "Veuillez choisir un destinataire";
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              onChanged: (value) {
                print(currentReceiver ==
                    const ContactModel.initialReceiverState());
              },
              validator: (value) {
                if (value!.isNotEmpty && currentReceiver ==
                    const ContactModel.initialReceiverState()) return errorText;
                return null;
              },
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
                      onPressed: state.loading
                          ? null
                          : currentReceiver ==
                                  const ContactModel.initialUserState()
                              ? null
                              : () {
                                  if (controller.text.isNotEmpty) {
                                    context.read<MessageBloc>().add(
                                        MessagePostMessageStartEvent(
                                            message: MessageModel(
                                                id: GetIt.instance<UuidV4>()
                                                    .generate(),
                                                content: controller.text,
                                                date: DateTime.now(),
                                                from: widget.userId,
                                                to: widget.receiverId)));
                                  }
                                },
                      style: TextButton.styleFrom(
                          disabledBackgroundColor: Colors.grey,
                          disabledForegroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
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
      ),
    );
  }
}

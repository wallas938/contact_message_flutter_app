import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contact.receiver.list.widget.dart';
import 'package:flutter/material.dart';

class MessageDrawerWidget extends StatelessWidget {
  final List<ContactModel> receivers;
  final String userId;

  const MessageDrawerWidget(
      {super.key, required this.receivers, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const Text("Y O U R   C O N T A C T S"),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Scaffold.of(context).closeDrawer();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.redAccent,
                          )),
                    ),
                  )
                ],
              )),
          Expanded(
              child: ContactReceiverListWidget(
            userId: userId,
            receivers: receivers,
          )),
        ],
      ),
    );
  }
}

import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.drawer.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.header.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MessagePage extends StatefulWidget {
  final String contactId;

  const MessagePage({super.key, required this.contactId});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<ContactBloc>()
        .add(ContactSetCurrentUserStartEvent(userId: widget.contactId));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state.currentUser == const ContactModel.initialUserState()) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                toolbarHeight: 80,
                title: MessageHeaderWidget(
                  profile: state.contacts
                      .firstWhere((e) => widget.contactId == e.id)
                      .profile,
                ),
                actions: [
                  BlocConsumer<ContactBloc, ContactState>(
                    builder: (context, state) {
                      return IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          context
                              .read<ContactBloc>()
                              .add(ContactResetCurrentUserStartEvent());
                        },
                      );
                    },
                    listener: (BuildContext context, ContactState state) {
                      if (state.currentUser ==
                          const ContactModel.initialUserState()) {
                        GoRouter.of(context).go("/home");
                      }
                    },
                  )
                ],
                backgroundColor: Colors.white,
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
              drawer: BlocConsumer<ContactBloc, ContactState>(
                builder: (context, state) {
                  List<ContactModel> receivers = state.contacts
                      .where((contact) => contact.id != widget.contactId)
                      .toList();
                  return MessageDrawerWidget(
                    userId: widget.contactId,
                    receivers: receivers,
                  );
                },
                listener: (context, state) {},
              ),
              body: BlocBuilder<MessageBloc, MessageState>(
                builder: (context, state) {
                  return MessageListWidget(
                      messages: state.messages, contactId: widget.contactId);
                },
              ));
        },
      ),
    );
  }
}

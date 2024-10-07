import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.event.dart';
import 'package:contact_message_app/business/models/contact/contact.model.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.drawer.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.header.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.list.widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MessagePage extends StatelessWidget {
  final String contactId;

  const MessagePage({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 80,
            title: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                return MessageHeaderWidget(
                  profile: state.contacts
                      .firstWhere((e) => contactId == e.id)
                      .profile,
                );
              },
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
                listener: (context, state) {
                  if (kDebugMode) {
                    print(state.currentUser.id);
                  }
                  GoRouter.of(context).go("/home");
                },
                listenWhen: (context, state) {
                  return state.currentUser == const ContactModel.initialUserState();
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
                  .where((contact) => contact.id != contactId)
                  .toList();
              return MessageDrawerWidget(
                userId: contactId,
                receivers: receivers,
              );
            },
            listener: (context, state) {
              if (state.receiver == null) {
                context.read<MessageBloc>().add(MessageGetThreadStartEvent(
                    conversationData:
                        ContactConversationPair(from: contactId, to: "1")));
              }
            },
          ),
          body: BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.exception.hasError) {
                return Center(child: Text(state.exception.errorMessage));
              }
              return MessageListWidget(
                  messages: state.messages, contactId: contactId);
            },
          )),
    );
  }
}

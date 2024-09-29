import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.drawer.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.header.widget.dart';
import 'package:contact_message_app/presentation/pages/message_page/widgets/message/message.list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            title: BlocBuilder<ContactBloc, ContactState>( //ContactBloc => MessageBloc
              builder: (context, state) {
                return MessageHeaderWidget(profile: state.contacts.firstWhere((e) => contactId == e.id).profile,);
              },
            ),
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
          drawer: BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              return MessageDrawerWidget(userId: contactId, contacts: state.contacts,);
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
              return MessageListWidget(messages: state.messages, contactId: contactId);
            },
          )),
    );
  }
}

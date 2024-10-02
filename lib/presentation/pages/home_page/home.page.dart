import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact.event.dart';
import 'package:contact_message_app/business/models/contact/contact.enum.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contact_list.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/menu/menu_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ContactBloc>().add(ContactGetAllStartEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flexibleSpace: const Padding(
          padding: EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: MenuButtonList(),
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Divider(
              thickness: 5,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: BlocBuilder<ContactBloc, ContactState>(
              builder: (context, state) {
                if (state.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.exception.hasError) {
                  return Center(child: Text(state.exception.errorMessage));
                }

                return ContactList(
                    contacts: state.contactRole == ContactRole.contact
                        ? state.contacts
                        : state.contacts
                            .where((c) => c.role == state.contactRole)
                            .toList());
              },
            ))
          ],
        ),
      ),
    );
  }
}

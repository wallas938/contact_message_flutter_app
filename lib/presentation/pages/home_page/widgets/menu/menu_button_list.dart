import 'package:contact_message_app/business/bloc/contact/contact_bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact_event.dart';
import 'package:contact_message_app/data/repository/contact_repository_impl.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/menu/menu_button_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuButtonList extends StatelessWidget {
  const MenuButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuButtonItem(buttonLabel: "Contacts", action: () => context.read<ContactBloc>().add(ContactGetAllEvent())),
        MenuButtonItem(buttonLabel: "Students", action: () => context.read<ContactRepositoryImpl>().getAllContacts()),
        MenuButtonItem(buttonLabel: "Developers", action: () => context.read<ContactRepositoryImpl>().getAllContacts())
      ],
    );
  }
}

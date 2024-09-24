import 'package:contact_message_app/business/bloc/contact/contact_bloc.dart';
import 'package:contact_message_app/business/bloc/contact/contact_event.dart';
import 'package:contact_message_app/business/models/contact/contact_enum.dart';
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
        MenuButtonItem(
            buttonLabel: "Contacts",
            action: () =>
                context.read<ContactBloc>().add(ContactGetAllStartEvent())),
        MenuButtonItem(
            buttonLabel: "Students",
            action: () => context
                .read<ContactBloc>()
                .add(ContactGetByRoleStartEvent(role: ContactRole.student))),
        MenuButtonItem(
            buttonLabel: "Developers",
            action: () =>context
                .read<ContactBloc>()
                .add(ContactGetByRoleStartEvent(role: ContactRole.developer)))
      ],
    );
  }
}

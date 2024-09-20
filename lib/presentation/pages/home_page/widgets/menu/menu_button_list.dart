import 'package:contact_message_app/presentation/pages/home_page/widgets/menu/menu_button_item.dart';
import 'package:flutter/material.dart';

class MenuButtonList extends StatelessWidget {
  const MenuButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MenuButtonItem(buttonLabel: "Contacts"),
        MenuButtonItem(buttonLabel: "Students"),
        MenuButtonItem(buttonLabel: "Developers")
      ],
    );
  }
}

import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contat_list.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/menu/menu_button_list.dart';
import 'package:flutter/material.dart';
import 'package:contact_message_app/data/database/database_data.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const MenuButtonList(),
            const SizedBox(height: 50,),
            const Divider(thickness: 5, color: Colors.grey,),
            const SizedBox(height: 20,),
            Expanded(child: ContactList(contacts: contacts))
          ],
        ),
      ),
    );
  }
}

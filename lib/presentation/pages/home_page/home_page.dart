import 'package:contact_message_app/presentation/pages/home_page/widgets/contact/contat_list.dart';
import 'package:contact_message_app/presentation/pages/home_page/widgets/menu/menu_button_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MenuButtonList(),
            SizedBox(height: 20,),
            Divider(height: 2, color: Colors.deepOrange,),
            SizedBox(height: 20,),
            ContactList(contacts: [])
          ],
        ),
      ),
    );
  }
}

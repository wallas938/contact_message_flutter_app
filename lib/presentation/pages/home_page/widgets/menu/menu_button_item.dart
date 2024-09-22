import 'package:contact_message_app/business/bloc/contact/contact_bloc.dart';
import 'package:contact_message_app/data/repository/contact_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuButtonItem extends StatelessWidget {
  final String buttonLabel;
  final VoidCallback action;

  const MenuButtonItem({required this.buttonLabel, super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        border: Border.all(width: 1),
      ),
      child: TextButton(
          onPressed: action,
          child: Text(
            buttonLabel,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}

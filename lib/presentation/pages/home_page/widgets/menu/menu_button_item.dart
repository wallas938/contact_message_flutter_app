import 'package:flutter/material.dart';

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

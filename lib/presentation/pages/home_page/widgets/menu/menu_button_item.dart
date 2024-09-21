import 'package:flutter/material.dart';

class MenuButtonItem extends StatelessWidget {
  final String buttonLabel;

  const MenuButtonItem({required this.buttonLabel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        border: Border.all(width: 1),
      ),
      child: TextButton(
          onPressed: () {},
          child: Text(
            buttonLabel,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );
  }
}

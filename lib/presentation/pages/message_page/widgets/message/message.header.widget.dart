import 'package:flutter/material.dart';

class MessageHeaderWidget extends StatelessWidget {
  final String profile;
  const MessageHeaderWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Text(profile, style: const TextStyle(color: Colors.redAccent),),
        )
      ],
    );
  }
}

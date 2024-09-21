import 'package:contact_message_app/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:contact_message_app/common/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: HomePage()),
    );
  }
}

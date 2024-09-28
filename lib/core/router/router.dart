import 'package:contact_message_app/presentation/pages/home_page/home.page.dart';
import 'package:contact_message_app/presentation/pages/message_page/message.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final routes = GoRouter(
  initialLocation: '/home',
  // initialLocation: '/messages/1',
  routes: [
    GoRoute(
      name: 'home',
      // Optional, add name to your routes. Allows you navigate by name instead of path
      path: '/home',
      builder: (context, state) => const SafeArea(child: HomePage()),
    ),
    GoRoute(
      name: 'messages',
      path: '/messages/:contactId',
      builder: (context, state) {
        if(state.pathParameters["contactId"]!= null) {
          String contactId = state.pathParameters["contactId"] as String;
          return MessagePage(contactId: contactId);
        }
        return const SafeArea(child: HomePage());
      },
    ),
  ],
);

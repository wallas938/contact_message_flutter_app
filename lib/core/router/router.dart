import 'package:contact_message_app/core/router/router.bloc.dart';
import 'package:contact_message_app/presentation/pages/home_page/home.page.dart';
import 'package:contact_message_app/presentation/pages/message_page/message.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// GoRouter configuration
final routes = GoRouter(
  initialLocation: '/home',
  navigatorKey: _rootNavigatorKey,
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
        if (kDebugMode) {
          print(state.pathParameters["contactId"]);
        }
        return MessagePage(
            contactId: state.pathParameters["contactId"] as String);
      },

//   if (state.pathParameters["contactId"] != null) {
//     String contactId = state.pathParameters["contactId"] as String;
//     return MessagePage(contactId: contactId);
//   }
//   return const SafeArea(child: HomePage());
// },
      redirect: (context, state) {
        final isAuthorized = context.read<MyRouterBloc>().state.isAuthorized;

        if (kDebugMode) {
          print("User is Authorized: $isAuthorized");
        }

        if (!isAuthorized) {
          return '/home';
        }
        return null;
      },
    ),
  ],
);

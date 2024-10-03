import 'package:contact_message_app/business/bloc/contact/contact.bloc.dart';
import 'package:contact_message_app/business/bloc/messages/message.bloc.dart';
import 'package:contact_message_app/business/repository/contact/contact.repository.impl.dart';
import 'package:contact_message_app/business/repository/message/message/message.repository.impl.dart';
import 'package:contact_message_app/core/router/router.bloc.dart';
import 'package:contact_message_app/data/provider/contact/contact.data.provider.impl.dart';
import 'package:contact_message_app/data/provider/message/message/message.data.provider.impl.dart';
import 'package:flutter/material.dart';
import 'package:contact_message_app/common/core/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:contact_message_app/data/database/database.data.dart';
import 'package:contact_message_app/core/router/router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:uuid/v4.dart';

void main() {
  setPathUrlStrategy();
  GetIt.instance.registerLazySingleton(() => Database());
  GetIt.instance.registerLazySingleton(() => ContactDataProviderImpl());
  GetIt.instance.registerLazySingleton(() => MessageDataProviderImpl());
  GetIt.instance.registerLazySingleton(() => const UuidV4());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => ContactRepositoryImpl()),
          RepositoryProvider(create: (context) => MessageRepositoryImpl()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    ContactBloc(context.read<ContactRepositoryImpl>())),
            BlocProvider(
                create: (context) =>
                    MessageBloc(context.read<MessageRepositoryImpl>())),
            BlocProvider(create: (context) => MyRouterBloc()),
          ],
          child: MaterialApp.router(
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
          ),
        ));
  }
}

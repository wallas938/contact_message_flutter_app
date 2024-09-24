import 'package:contact_message_app/business/bloc/contact/contact_bloc.dart';
import 'package:contact_message_app/business/repository/contact_repository_impl.dart';
import 'package:contact_message_app/data/provider/contact_data_provider_impl.dart';
import 'package:contact_message_app/presentation/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:contact_message_app/common/core/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:contact_message_app/data/database/database_data.dart';

void main() {
  GetIt.instance.registerLazySingleton(() => Database());
  GetIt.instance.registerLazySingleton(() => ContactDataProviderImpl());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => ContactRepositoryImpl()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    ContactBloc(context.read<ContactRepositoryImpl>()))
          ],
          child: MaterialApp(
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            home: const SafeArea(child: HomePage()),
          ),
        ));
  }
}

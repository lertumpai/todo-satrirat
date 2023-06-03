import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientListScreen.dart';
import 'package:todo_satrirat/settings/bloc/settings.cubit.dart';
import 'package:todo_satrirat/settings/settingsScreen.dart';

import 'db/db.dart';
import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(
          create: (BuildContext context) => SettingsCubit(),
        )
      ],
      child: MaterialApp(
        title: 'แอพหมูอ้วง',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/patient-list': (context) => const PatientListPage(),
          '/patient': (context) => const PatientEditablePage(),
          '/settings': (context) => const SettingsPage(),
        },
      ),
    );
  }
}



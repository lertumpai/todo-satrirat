import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientListScreen.dart';
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
    return MaterialApp(
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
    );
  }
}



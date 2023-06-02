import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientListScreen.dart';

import 'homeScreen.dart';

void main() {
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
        primarySwatch: Colors.teal
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/patient-list': (context) => const PatientListPage(),
      },
    );
  }
}



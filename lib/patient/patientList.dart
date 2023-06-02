import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patient.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children:const [
          Patient()
        ]
      ),
    );
  }
}
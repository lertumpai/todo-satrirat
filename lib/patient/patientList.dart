import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patient.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return const Patient();
        },
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: 15,
      ),
    );
  }
}
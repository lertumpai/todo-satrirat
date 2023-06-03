import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patient.dart';

import '../db/model/patient.dart';

class PatientList extends StatelessWidget {
  final List<PatientModel> patients;
  final Function(int) onDeletePatient;

  const PatientList({
    super.key,
    required this.patients,
    required this.onDeletePatient
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        itemBuilder: (BuildContext context, int index) {
          if (index == patients.length) {
            return const SizedBox(height: 1);
          }

          return Patient(
            patient: patients[index],
            deletePatient: onDeletePatient,
          );
        },
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: patients.length + 1,
      ),
    );
  }
}
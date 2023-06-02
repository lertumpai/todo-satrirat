import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patient.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        itemBuilder: (BuildContext context, int index) {
          if (index == 14) {
            return const SizedBox(height: 1);
          }

          return Patient(index: index);
        },
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: 15,
      ),
    );
  }
}
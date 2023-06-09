import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/todo.dart';
import 'package:todo_satrirat/patient/models/PatientItem.dart';
import 'package:todo_satrirat/patient/patient.dart';

import '../db/model/patient.dart';

class PatientList extends StatelessWidget {
  final List<PatientItemState> patients;
  final List<TodoModel> todos;
  final Function(int) onDeletePatient;
  final FocusNode focusSearch;

  const PatientList({
    super.key,
    required this.patients,
    required this.todos,
    required this.onDeletePatient,
    required this.focusSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(" ${patients.length} results",
                  style: const TextStyle(fontSize: 20, color: Colors.black26))),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (index == patients.length) {
                  return const SizedBox(height: 1);
                }

                return Patient(
                  patient: patients[index].patient,
                  patientTodos: patients[index].patientTodos,
                  todos: todos,
                  deletePatient: onDeletePatient,
                  focusSearch: focusSearch,
                );
              },
              separatorBuilder: (context, i) => const SizedBox(height: 10),
              itemCount: patients.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}

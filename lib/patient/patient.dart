import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';

import '../db/model/patient.dart';
import '../transitionBuilder.dart';

class Patient extends StatelessWidget {
  final PatientModel patient;
  final List<PatientTodoModel> patientTodos;
  final List<TodoModel> todos;
  final Function(int) deletePatient;
  final FocusNode focusSearch;

  const Patient(
      {super.key,
      required this.patient,
      required this.todos,
      required this.patientTodos,
      required this.deletePatient,
      required this.focusSearch});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusSearch.unfocus();
        Navigator.of(context).push(patientEditableRoute(patient.id));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: Colors.teal.shade200)),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PatientHn(patient: patient, deletePatient: deletePatient),
                Divider(
                  color: Colors.teal.shade200,
                  thickness: 2.0,
                ),
                PatientNote(
                  note: patient.note!,
                ),
                const SizedBox(height: 10),
                PatientTodos(
                  patientTodos: patientTodos,
                  todos: todos,
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class PatientHn extends StatelessWidget {
  final Function(int) deletePatient;
  final PatientModel patient;

  const PatientHn(
      {super.key, required this.deletePatient, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.person, size: 40, color: Colors.black54),
                  const SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(patient.hn!,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black87,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.clip),
                      Text(
                          "สร้างเมื่อ: ${Day.fromDateTime(patient.createdAt!).format("DD/MM/YYYY HH:mm")} [${patient.id}]",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black26)),
                      Text(
                          "อัพเดตเมื่อ: ${Day.fromDateTime(patient.updatedAt!).format("DD/MM/YYYY HH:mm")}",
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black26)),
                    ],
                  )
                ],
              )
            ],
          ),
          PatientDeleteButton(id: patient.id, deletePatient: deletePatient),
        ]);
  }
}

class PatientNote extends StatelessWidget {
  final String note;

  const PatientNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Icon(Icons.sticky_note_2_outlined, size: 40, color: Colors.black54),
      const SizedBox(width: 5),
      Flexible(
          child: Text(note != "" ? note : "ไม่มีการบันทึก",
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.clip))
    ]);
  }
}

class PatientDeleteButton extends StatelessWidget {
  final Function(int) deletePatient;
  final int id;

  const PatientDeleteButton({
    super.key,
    required this.deletePatient,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red.shade500,
      highlightColor: Colors.white,
      iconSize: 30,
      onPressed: () {
        deletePatient(id);
      },
    );
  }
}

class PatientTodos extends StatelessWidget {
  final List<PatientTodoModel> patientTodos;
  final List<TodoModel> todos;

  const PatientTodos(
      {super.key, required this.patientTodos, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return PatientTodo(
            patientTodo: patientTodos[index],
            todo: todos
                .firstWhere((todo) => todo.id == patientTodos[index].todoId));
      },
      separatorBuilder: (context, i) => const SizedBox(height: 10),
      itemCount: patientTodos.length,
    );
  }
}

class PatientTodo extends StatelessWidget {
  final PatientTodoModel patientTodo;
  final TodoModel todo;

  const PatientTodo({super.key, required this.patientTodo, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Icon(
          patientTodo.done == true
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          size: 40,
          color: patientTodo.done == true
              ? Colors.teal.shade300
              : Colors.red.shade300),
      const SizedBox(width: 5),
      Flexible(
          child: Text(todo.name!,
              style: const TextStyle(fontSize: 20, color: Colors.black87),
              overflow: TextOverflow.clip))
    ]);
  }
}

Route patientEditableRoute(int patientId) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PatientEditablePage(id: patientId),
    transitionsBuilder: transitionsBuilder,
  );
}

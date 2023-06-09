import 'dart:convert';
import 'dart:typed_data';

import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientImageZoomAbleScreen.dart';

import '../db/model/patient.dart';
import '../transitionBuilder.dart';

class Patient extends StatelessWidget {
  final PatientModel patient;
  final List<PatientTodoModel> patientTodos;
  final List<PatientImageModel> patientImages;
  final List<TodoModel> todos;
  final Function(int) deletePatient;
  final FocusNode focusSearch;

  const Patient(
      {super.key,
      required this.patient,
      required this.todos,
      required this.patientTodos,
      required this.patientImages,
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
                PatientImages(
                  patientImages: patientImages,
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

class PatientImages extends StatelessWidget {
  final List<PatientImageModel> patientImages;

  const PatientImages({super.key, required this.patientImages});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (patientImages.isEmpty) {
          return;
        }

        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
              backgroundColor: Colors.white,
              content: PatientImageList(
                patientImages: patientImages,
              )),
        );
      },
      child: Container(
        color: Colors.white10,
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Icon(Icons.image,
              size: 40,
              color: patientImages.isEmpty
                  ? Colors.black54
                  : Colors.teal.shade400),
          const SizedBox(width: 5),
          Text("${patientImages.length} Images",
              style: const TextStyle(fontSize: 20))
        ]),
      ),
    );
  }
}

class PatientImageList extends StatelessWidget {
  final List<PatientImageModel> patientImages;

  const PatientImageList({super.key, required this.patientImages});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 500,
          height: 500,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return PatientImageItem(patientImage: patientImages[index]);
            },
            separatorBuilder: (context, i) => const SizedBox(height: 10),
            itemCount: patientImages.length,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.clear_rounded),
              color: Colors.red.shade500,
              highlightColor: Colors.red.shade50,
              iconSize: 40,
            ),
          ],
        )
      ],
    );
  }
}

class PatientImageItem extends StatelessWidget {
  final PatientImageModel patientImage;

  const PatientImageItem({super.key, required this.patientImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(patientImageZoomableRoute(patientImage.image!));
      },
      child: SizedBox(
        height: 200,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Image.memory(
            base64Decode(patientImage.image!),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
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

Route patientImageZoomableRoute(String image) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PatientImageZoomablePage(
      image: image,
    ),
    transitionsBuilder: transitionsBuilder,
  );
}

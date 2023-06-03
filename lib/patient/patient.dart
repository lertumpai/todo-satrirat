import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';

import '../db/model/patient.dart';

class Patient extends StatelessWidget {
  final PatientModel patient;
  final Function(int) deletePatient;

  const Patient({
    super.key,
    required this.patient,
    required this.deletePatient
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PatientEditablePage(id: patient.id))
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2,
              color: Colors.teal.shade200
          )
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PatientHn(
                      id: patient.id,
                      hn: patient.hn!,
                      updatedAt: patient.updatedAt!,
                      deletePatient: deletePatient
                  ),
                  Divider(
                    color: Colors.teal.shade200,
                    thickness: 2.0,
                  ),
                  PatientNote(
                    note: patient.note!,
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class PatientHn extends StatelessWidget {
  final String hn;
  final Function(int) deletePatient;
  final int id;
  final DateTime updatedAt;

  const PatientHn({
    super.key,
    required this.hn,
    required this.deletePatient,
    required this.id,
    required this.updatedAt,
  });

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
                  const Icon(Icons.person, size: 30, color: Colors.black54),
                  const SizedBox(width: 5),
                  Text(hn, style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700)),
                  Text(" (${Day.fromDateTime(updatedAt).format("DD-MM-YYYY HH:mm")})", style: const TextStyle(fontSize: 20, color: Colors.black26)),
                ],
              )
            ],
          ),
          PatientDeleteButton(id: id, deletePatient: deletePatient),
        ]
    );
  }
}

class PatientNote extends StatelessWidget {
  final String note;

  const PatientNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.sticky_note_2_outlined, size: 30, color: Colors.black54),
          const SizedBox(width: 5),
          Flexible(
              child: Text(
                  note != "" ? note : "ไม่มีการบันทึก",
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                  overflow: TextOverflow.clip
              )
          )
        ]
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
      iconSize: 30,
      onPressed: () {
        deletePatient(id);
      },
    );
  }
}


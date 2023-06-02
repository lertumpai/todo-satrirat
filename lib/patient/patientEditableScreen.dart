import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditable.dart';

class PatientEditablePage extends StatelessWidget {
  final int? index;
  final String? hn;
  final String? note;

  const PatientEditablePage({super.key, this.index, this.hn = "", this.note = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save, size: 30)
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const PatientEditable(),
      )
    );
  }
}
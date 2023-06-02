import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientList.dart';
import 'package:todo_satrirat/patient/patientManage.dart';

class PatientListPage extends StatelessWidget {
  const PatientListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            PatientManage(),
            SizedBox(height: 10),
            PatientList(),
          ],
        ),
      ),
    );
  }
}
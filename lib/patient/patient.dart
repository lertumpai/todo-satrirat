import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';

class Patient extends StatelessWidget {
  final int? index;

  const Patient({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PatientEditablePage(index: index)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PatientHn(),
                  Divider(
                    color: Colors.black54,
                    thickness: 1.0,
                  ),
                  PatientNote()
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
  const PatientHn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: const [
                  Icon(Icons.person, size: 30, color: Colors.black54),
                  SizedBox(width: 5),
                  Text("123456", style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w600)),
                ],
              )
            ],
          ),
          const PatientDeleteButton(),
        ]
    );
  }
}

class PatientNote extends StatelessWidget {
  const PatientNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.sticky_note_2_outlined, size: 30, color: Colors.black54),
          SizedBox(width: 5),
          Flexible(
              child: Text(
                  "สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า สวัสดีค่า",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                  overflow: TextOverflow.clip
              )
          )
        ]
    );
  }
}

class PatientDeleteButton extends StatelessWidget {
  const PatientDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red.shade500,
      iconSize: 30,
      onPressed: () {},
    );
  }
}


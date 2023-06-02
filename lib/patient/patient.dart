import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PatientHn(),
                  PatientNote()
                ],
              ),
            )
          ),
          const PatientDeleteButton(),
        ],
      ),
    );
  }
}

class PatientHn extends StatelessWidget {
  const PatientHn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(Icons.person, size: 30, color: Colors.black54),
        SizedBox(width: 5),
        Text("123456", style: TextStyle(fontSize: 24, color: Colors.white)),
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
          Flexible(child: Text("abc", style: TextStyle(fontSize: 20, color: Colors.white), overflow: TextOverflow.clip))
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
      iconSize: 40,
      onPressed: () {},
    );
  }
}


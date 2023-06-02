import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
               PatientHn(),
              PatientNote()
            ],
        ),
          const PatientDeleteButton()
        ],
      ),
    );
  }
}

class PatientHn extends StatelessWidget {
  const PatientHn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("hn: 123456", style: TextStyle(fontSize: 18, color: Colors.white));
  }
}

class PatientNote extends StatelessWidget {
  const PatientNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("note: Hello", style: TextStyle(fontSize: 18, color: Colors.white));
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


import 'package:flutter/material.dart';

class PatientEditablePage extends StatelessWidget {
  final int? index;

  const PatientEditablePage({super.key, this.index = 0});

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
      body: Text(index.toString()),
    );
  }
}
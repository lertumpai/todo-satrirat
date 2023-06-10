import 'package:flutter/material.dart';

class PatientImageEditablePage extends StatelessWidget {
  const PatientImageEditablePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

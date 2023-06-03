import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patient.dart';
import 'package:todo_satrirat/settings/settingsList.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_card, size: 30)
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: const [
            SettingsListPage()
          ],
        )
      ),
    );
  }
}
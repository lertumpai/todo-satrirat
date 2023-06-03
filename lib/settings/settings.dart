import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientList.dart';
import 'package:todo_satrirat/patient/patientManage.dart';

import '../db/model/todo.dart';

class Settings extends StatelessWidget {
  final Todo todo;

  const Settings({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SettingsOption(option: todo.name ?? ""),
        const SettingsDelete(),
      ],
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String option;

  const SettingsOption({super.key, required this.option});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          const SizedBox(width: 5),
          Flexible(child: Text(option, style: const TextStyle(fontSize: 24), overflow: TextOverflow.clip)),
        ],
      ),
    );
  }
}

class SettingsDelete extends StatelessWidget {
  const SettingsDelete({super.key});

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
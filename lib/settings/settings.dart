import 'package:flutter/material.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientList.dart';
import 'package:todo_satrirat/patient/patientManage.dart';

class Settings extends StatelessWidget {
  final String? option;

  const Settings({super.key, this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SettingsOption(option: option),
          const SettingsDelete(),
        ],
      ),
    );
  }
}

class SettingsOption extends StatelessWidget {
  final String? option;

  const SettingsOption({super.key, this.option = ""});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 5),
        Text(option!, style: const TextStyle(fontSize: 30)),
      ],
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
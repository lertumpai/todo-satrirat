import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/patient/patient.dart';
import 'package:todo_satrirat/settings/settingsList.dart';

import 'bloc/settings.cubit.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    void onCreateTodo(String name) {
      context.read<SettingsCubit>().create(name);
    }
    void onDeleteTodo(int id) {
      context.read<SettingsCubit>().delete(id);
    }
    void onUpdateTodo(int id, String name) {
      context.read<SettingsCubit>().update(id, name);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {
                onCreateTodo("");
              },
              icon: const Icon(Icons.add_card, size: 30)
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            BlocBuilder<SettingsCubit, TodoListType>(
              builder: (context, todos) {
                return SettingsListPage(
                  todos: todos,
                  onDeleteTodo: onDeleteTodo,
                  onUpdateTodo: onUpdateTodo
                );
              }
            )
          ],
        )
      ),
    );
  }
}
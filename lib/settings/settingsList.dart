import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/patientEditableScreen.dart';
import 'package:todo_satrirat/patient/patientList.dart';
import 'package:todo_satrirat/patient/patientManage.dart';
import 'package:todo_satrirat/settings/settings.dart';

import 'bloc/settings.cubit.dart';

class SettingsListPage extends StatefulWidget {
  const SettingsListPage({super.key});

  @override
  State<SettingsListPage> createState() => _SettingsListPageState();
}

class _SettingsListPageState extends State<SettingsListPage> {
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, TodoListType>(
      builder: (context, todos) {
        return Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
            itemBuilder: (BuildContext context, int index) {
              if (index == todos.length) {
                return const SizedBox(height: 1);
              }

              return Settings(todo: todos[index]);
            },
            separatorBuilder: (context, i) => const Divider(color: Colors.black54, thickness: 1.0),
            itemCount: todos.length + 1,
          ),
        );
      }
    );
  }
}
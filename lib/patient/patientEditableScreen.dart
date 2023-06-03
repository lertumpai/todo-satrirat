import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.cubit.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.state.dart';
import 'package:todo_satrirat/patient/patientEditable.dart';

import 'bloc/patientList.cubit.dart';

class PatientEditablePage extends StatefulWidget {
  final int? id;

  const PatientEditablePage({
    super.key,
    this.id,
  });

  @override
  State<PatientEditablePage> createState() => _PatientEditablePageState();
}

class _PatientEditablePageState extends State<PatientEditablePage> {
  @override
  void initState() {
    super.initState();
    context.read<PatientEditingCubit>().clear();
    context.read<PatientEditingCubit>().initPatientEditing(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    void onSave() {
      context.read<PatientEditingCubit>().save();
    }
    void onHnChange(String hn) {
      context.read<PatientEditingCubit>().updatePatientHn(hn);
    }
    void onNoteChange(String note) {
      context.read<PatientEditingCubit>().updatePatientNote(note);
    }
    void onTogglePatientTodo(int patientTodoId) {
      context.read<PatientEditingCubit>().toggleDoneByPatientIdAndPatientTodoId(patientTodoId);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {
                onSave();
              },
              icon: const Icon(Icons.save, size: 30)
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocConsumer<PatientEditingCubit, PatientEditingState>(
        listener: (context, state) {
          if (state.status == PatientEditingStatusEnum.saved) {
            Navigator.pop(context);
            context.read<PatientListCubit>().loading();
          }
        },
        builder: (context, state) {
          return state.patient != null
              ? Container(
            padding: const EdgeInsets.all(10),
            child: PatientEditable(
              patient: state.patient!,
              patientTodos: state.patientTodos,
              todos: state.todos,
              onTogglePatientTodo: onTogglePatientTodo,
              onHnChange: onHnChange,
              onNoteChange: onNoteChange,
            ),
          ) : const SizedBox();
        }
      )
    );
  }
}
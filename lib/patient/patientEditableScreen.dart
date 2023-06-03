import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.cubit.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.state.dart';
import 'package:todo_satrirat/patient/patientEditable.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: () {
                onSave();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.save, size: 30)
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<PatientEditingCubit, PatientEditingState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: PatientEditable(
              patient: state.patient!,
              onHnChange: onHnChange,
              onNoteChange: onNoteChange,
            ),
          );
        }
      )
    );
  }
}
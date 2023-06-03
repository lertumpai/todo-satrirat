import 'package:bloc/bloc.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.state.dart';

import '../../db/db.dart';

class PatientEditingCubit extends Cubit<PatientEditingState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<PatientModel>();

  PatientEditingCubit() : super(const PatientEditingState());

  clear() {
    emit(const PatientEditingState());
  }

  initPatientEditing(int? id) async {
    PatientModel? patient;

    if (id != null) {
      patient = await patientRepo?.get(id);
    }
    else {
      patient = PatientModel();
      final now = DateTime.now();
      patient.hn = "";
      patient.note = "";
      patient.createdAt = now;
      patient.updatedAt = now;
    }

    emit(PatientEditingState(patient: patient));
  }

  updatePatientHn(String hn) {
    final updatedState = state.updateHn(hn);
    emit(updatedState);
  }

  updatePatientNote(String note) {
    final updatedState = state.updateNote(note);
    emit(updatedState);
  }

  save() async {
    await db?.writeTxn(() async {
      await patientRepo?.put(state.patient!);
    });
  }
}
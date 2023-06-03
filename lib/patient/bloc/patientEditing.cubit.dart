import 'package:bloc/bloc.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.state.dart';

import '../../db/db.dart';

class PatientEditingCubit extends Cubit<PatientEditingState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<Patient>();

  PatientEditingCubit() : super(const PatientEditingState());

  clear() {
    emit(const PatientEditingState());
  }

  initPatientEditing(int? id) async {
    Patient? patient;

    if (id != null) {
      patient = await patientRepo?.get(id);
    }
    else {
      patient = Patient();
      final now = DateTime.now();
      patient.hn = "";
      patient.note = "";
      patient.createdAt = now;
      patient.updatedAt = now;
    }

    emit(PatientEditingState(patient: patient));
  }

  save() async {
    await db?.writeTxn(() async {
      await patientRepo?.put(state.patient!);
    });
  }
}
import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/patient/bloc/patientList.state.dart';

import '../../db/db.dart';

class PatientListCubit extends Cubit<PatientListState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<Patient>();

  PatientListCubit() : super(const PatientListState(patients: []));

  void getAllPatient() async {
    final patients = await patientRepo?.where().findAll();
    state.updatePatients(patients!);
    emit(state);
  }

  void deletePatient(int id) async {
    await db?.writeTxn(() async {
      await patientRepo?.delete(id);
    });

    getAllPatient();
  }
}
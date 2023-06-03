import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/patient/bloc/patientList.state.dart';

import '../../db/db.dart';

class PatientManagementCubit extends Cubit<PatientManagementState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<Patient>();

  PatientManagementCubit() : super(const PatientManagementState(patients: []));

  void getAllPatient() async {
    final patients = await patientRepo?.where().findAll();
    state.updatePatients(patients!);
    emit(state);
  }

  void createPatient(String name) async {
    final newPatient = Patient();
    final now = DateTime.now();
    newPatient.hn = "hn${now.toIso8601String()}";
    newPatient.note = "note${now.toIso8601String()}";
    newPatient.createdAt = now;
    newPatient.updatedAt = now;

    await db?.writeTxn(() async {
      await patientRepo?.put(newPatient);
    });

    getAllPatient();
  }

  void deletePatient(int id) async {
    await db?.writeTxn(() async {
      await patientRepo?.delete(id);
    });

    getAllPatient();
  }
}
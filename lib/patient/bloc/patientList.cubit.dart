import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/patient/bloc/patientList.state.dart';

import '../../db/db.dart';
import '../patient.dart';

class PatientListCubit extends Cubit<PatientListState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<PatientModel>();

  PatientListCubit() : super(const PatientListState(patients: []));

  void loading() {
    final newState = state
        .updateStatus(PatientListStatusEnum.loading);
    emit(newState);
  }

  void getAll() async {
    loading();
    final patients = await patientRepo?.where().findAll();
    final newState = state
        .updatePatients(patients!)
        .updateStatus(PatientListStatusEnum.ready);
    emit(newState);
  }

  void delete(int id) async {
    await db?.writeTxn(() async {
      await patientRepo?.delete(id);
    });

    final newState = state.updateStatus(PatientListStatusEnum.loading);
    emit(newState);
  }

  void search(String hn) async {
    final searching = state
        .updateStatus(PatientListStatusEnum.searching);
    emit(searching);

    final patients = await patientRepo?.filter().hnContains(hn).findAll();
    final newState = state
        .updatePatients(patients!)
        .updateStatus(PatientListStatusEnum.ready);
    emit(newState);
  }
}
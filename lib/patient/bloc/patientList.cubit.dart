import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/db/model/todo.dart';
import 'package:todo_satrirat/patient/bloc/patientList.state.dart';
import 'package:todo_satrirat/patient/models/PatientItem.dart';

import '../../db/db.dart';
import '../../db/model/patientTodo.dart';

class PatientListCubit extends Cubit<PatientListState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<PatientModel>();
  final patientTodoRepo = Database.instance?.collection<PatientTodoModel>();
  final todoRepo = Database.instance?.collection<TodoModel>();

  PatientListCubit() : super(const PatientListState(patients: []));

  void loading() {
    final newState = state.updateStatus(PatientListStatusEnum.loading);
    emit(newState);
  }

  void delete(int id) async {
    await db?.writeTxn(() async {
      await patientRepo?.delete(id);
      await patientTodoRepo?.filter().patientIdEqualTo(id).deleteAll();
    });

    final newState = state.updateStatus(PatientListStatusEnum.loading);
    emit(newState);
  }

  void search(String hn) async {
    final searching = state.updateStatus(PatientListStatusEnum.searching);
    emit(searching);

    final todos = await todoRepo?.where().findAll();
    final patients = await patientRepo?.filter().hnContains(hn).findAll();
    final patientItems = await Future.wait(patients!.map((patient) async {
      List<PatientTodoModel> patientTodos = (await patientTodoRepo
          ?.filter()
          .patientIdEqualTo(patient.id)
          .sortByTodoId()
          .findAll())!;
      final patientItem = PatientItemState(patient, patientTodos);
      return patientItem;
    }));

    final newState = state
        .updatePatients(patientItems)
        .updateTodos(todos!)
        .updateStatus(PatientListStatusEnum.ready);
    emit(newState);
  }
}

import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';
import 'package:todo_satrirat/db/model/patient.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/patient/bloc/patientEditing.state.dart';

import '../../db/db.dart';
import '../../db/model/todo.dart';

class PatientEditingCubit extends Cubit<PatientEditingState> {
  final db = Database.instance;
  final patientRepo = Database.instance?.collection<PatientModel>();
  final todoRepo = Database.instance?.collection<TodoModel>();
  final patientTodoRepo = Database.instance?.collection<PatientTodoModel>();

  PatientEditingCubit() : super(const PatientEditingState());

  clear() {
    emit(const PatientEditingState());
  }

  initPatientEditing(int? id) async {
    PatientModel? patient;

    if (id != null) {
      patient = await patientRepo?.get(id);
    } else {
      patient = PatientModel();
      final now = DateTime.now();
      patient.hn = "";
      patient.note = "";
      patient.createdAt = now;
      patient.updatedAt = now;
    }

    final todos = await todoRepo?.where().findAll();
    List<PatientTodoModel> patientTodos =
        (await patientTodoRepo?.filter().patientIdEqualTo(id).findAll())!;

    final updatedState = state
        .initPatient(
          patient: patient!,
          patientTodos: patientTodos,
          todos: todos!,
        )
        .updateStatus(PatientEditingStatusEnum.ready);
    emit(updatedState);
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
    final updatedStatusSaving =
        state.updateStatus(PatientEditingStatusEnum.saving);
    emit(updatedStatusSaving);
    await db?.writeTxn(() async {
      final now = DateTime.now();
      state.patient!.updatedAt = now;
      final patientId = await patientRepo?.put(state.patient!);
      await patientTodoRepo?.filter().patientIdEqualTo(patientId).deleteAll();
      await Future.wait(state.patientTodos.map((patientTodo) async {
        patientTodo.patientId = patientId;
        return patientTodoRepo?.put(patientTodo);
      }));
    });
    final updatedStatusSaved =
        state.updateStatus(PatientEditingStatusEnum.saved);
    emit(updatedStatusSaved);
  }

  toggleDoneByTodoId(int todoId) {
    final updatedStatus = state.updateStatus(PatientEditingStatusEnum.toggle);
    emit(updatedStatus);
    final updatedToggle = state
        .toggleDoneByTodoId(todoId)
        .updateStatus(PatientEditingStatusEnum.ready);
    emit(updatedToggle);
  }

  addTodoList(List<int> todoIds) {
    final updatingPatientTodo =
        state.updateStatus(PatientEditingStatusEnum.updatingPatientTodo);
    emit(updatingPatientTodo);
    final updatedPatientTodo =
        state.addTodoList(todoIds).updateStatus(PatientEditingStatusEnum.ready);
    emit(updatedPatientTodo);
  }
}

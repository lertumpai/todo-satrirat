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
    }
    else {
      patient = PatientModel();
      final now = DateTime.now();
      patient.hn = "";
      patient.note = "";
      patient.createdAt = now;
      patient.updatedAt = now;
    }

    final todos = await todoRepo?.where().findAll();
    List<PatientTodoModel> patientTodos = (await patientTodoRepo?.filter().patientIdEqualTo(id).findAll())!;

    if (patientTodos.isEmpty) {
      patientTodos = todos!.map((TodoModel todo) {
        final patientTodo = PatientTodoModel();
        patientTodo.done = false;
        patientTodo.todoId = todo.id;
        return patientTodo;
      }).toList();
    }

    final updatedState = state.initPatient(
      patient: patient!,
      patientTodos: patientTodos!,
      todos: todos!,
    ).updateStatus(
        PatientEditingStatusEnum.ready
    );
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
    final updatedStatusSaving = state.updateStatus(PatientEditingStatusEnum.saving);
    emit(updatedStatusSaving);
    await db?.writeTxn(() async {
      final patientId = await patientRepo?.put(state.patient!);
      await Future.wait(
        state.todos!.map(
          (todo) async {
            final patientTodo = state.getPatientTodoByTodoId(todo.id);
            patientTodo.patientId = patientId;
            return patientTodoRepo?.put(patientTodo);
          }
        )
      );
    });
    final updatedStatusSaved = state.updateStatus(PatientEditingStatusEnum.saved);
    emit(updatedStatusSaved);
  }
}
import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';

import '../../db/model/patient.dart';

enum PatientEditingStatusEnum { init, ready, loading, saving, saved, toggle }

class PatientEditingState extends Equatable {
  final PatientModel? patient;
  final List<PatientTodoModel> patientTodos;
  final List<TodoModel> todos;
  final PatientEditingStatusEnum status;

  const PatientEditingState({
    this.patient,
    this.status = PatientEditingStatusEnum.init,
    this.patientTodos = const [],
    this.todos = const [],
  });

  PatientEditingState copyWith(
      {PatientModel? patient,
      List<PatientTodoModel>? patientTodos,
      List<TodoModel>? todos,
      PatientEditingStatusEnum? status}) {
    return PatientEditingState(
      patient: patient ?? this.patient,
      patientTodos: patientTodos ?? this.patientTodos,
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }

  PatientEditingState initPatient(
      {required PatientModel patient,
      required List<PatientTodoModel> patientTodos,
      required List<TodoModel> todos}) {
    return copyWith(
      patient: patient,
      patientTodos: patientTodos,
      todos: todos,
    );
  }

  PatientEditingState updateHn(String hn) {
    final now = DateTime.now();
    patient!.updatedAt = now;
    patient!.hn = hn;

    return copyWith(patient: patient);
  }

  PatientEditingState updateNote(String note) {
    final now = DateTime.now();
    patient!.updatedAt = now;
    patient!.note = note;

    return copyWith(patient: patient);
  }

  PatientEditingState updateStatus(PatientEditingStatusEnum status) {
    return copyWith(status: status);
  }

  PatientTodoModel getPatientTodoByTodoId(int todoId) {
    return patientTodos
        .firstWhere((patientTodo) => patientTodo.todoId == todoId);
  }

  PatientEditingState toggleDoneByTodoId(int todoId) {
    final updatedToggle = patientTodos.map((patientTodo) {
      if (patientTodo.todoId == todoId) {
        patientTodo.done = patientTodo.done == true ? false : true;
        return patientTodo;
      }
      return patientTodo;
    }).toList();
    return copyWith(
      patientTodos: updatedToggle,
    );
  }

  PatientEditingState addTodoList(List<int> todoIds) {
    final newPatientTodos = todoIds
        .where((todoId) =>
            patientTodos
                .firstWhere((patientTodo) => patientTodo.todoId == todoId) ==
            null)
        .map((todoId) {
      final patientTodo = PatientTodoModel();
      patientTodo.todoId = todoId;
      patientTodo.patientId = patient!.id;
      patientTodo.done = false;
      return patientTodo;
    }).toList();
    final updatedPatientTodos = [...patientTodos, ...newPatientTodos];
    return copyWith(
      patientTodos: updatedPatientTodos,
    );
  }

  @override
  List<Object?> get props => [
        patient,
        status,
      ];
}

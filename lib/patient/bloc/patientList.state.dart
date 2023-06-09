import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/todo.dart';

import '../models/PatientItem.dart';

enum PatientListStatusEnum { init, loading, searching, ready }

class PatientListState extends Equatable {
  final List<PatientItemState> patients;
  final List<TodoModel> todos;
  final PatientListStatusEnum status;

  const PatientListState({
    this.patients = const [],
    this.todos = const [],
    this.status = PatientListStatusEnum.init,
  });

  PatientListState updatePatients(List<PatientItemState> patients) {
    return PatientListState(patients: patients, todos: todos, status: status);
  }

  PatientListState updateTodos(List<TodoModel> todos) {
    return PatientListState(patients: patients, todos: todos, status: status);
  }

  PatientListState updateStatus(PatientListStatusEnum status) {
    return PatientListState(patients: patients, todos: todos, status: status);
  }

  @override
  List<Object?> get props => [
        patients,
        status,
      ];
}

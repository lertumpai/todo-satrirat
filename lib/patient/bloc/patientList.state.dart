import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
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

  PatientListState copyWith(
      {List<PatientItemState>? patients,
      List<TodoModel>? todos,
      PatientListStatusEnum? status,
      List<PatientImageModel>? patientImages}) {
    return PatientListState(
        patients: patients ?? this.patients,
        todos: todos ?? this.todos,
        status: status ?? this.status);
  }

  PatientListState updatePatients(List<PatientItemState> patients) {
    return copyWith(patients: patients);
  }

  PatientListState updateTodos(List<TodoModel> todos) {
    return copyWith(todos: todos);
  }

  PatientListState updateStatus(PatientListStatusEnum status) {
    return copyWith(status: status);
  }

  @override
  List<Object?> get props => [
        patients,
        status,
      ];
}

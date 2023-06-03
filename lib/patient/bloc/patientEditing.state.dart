import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';

import '../../db/model/patient.dart';

enum PatientEditingStatusEnum { init, ready, loading, saving, saved }

class PatientEditingState extends Equatable {
  final PatientModel? patient;
  final List<PatientTodoModel>? patientTodo;
  final List<TodoModel>? todo;
  final PatientEditingStatusEnum status;

  const PatientEditingState({
    this.patient,
    this.status = PatientEditingStatusEnum.init,
    this.patientTodo = const [],
    this.todo = const [],
  });

  PatientEditingState copyWith({
    PatientModel? patient,
    List<PatientTodoModel>? patientTodo,
    List<TodoModel>? todo,
    PatientEditingStatusEnum? status
  }) {
    return PatientEditingState(
      patient: patient ?? this.patient,
      patientTodo: patientTodo ?? this.patientTodo,
      todo: todo ?? this.todo,
      status: status ?? this.status,
    );
  }

  PatientEditingState initPatient({
    required PatientModel patient,
    required List<PatientTodoModel> patientTodo,
    required List<TodoModel> todo
  }) {
    return copyWith(
      patient: patient,
      patientTodo: patientTodo,
      todo: todo,
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

  @override
  List<Object?> get props => [
    patient,
    status,
  ];
}

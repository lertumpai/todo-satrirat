import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';

import '../../db/model/patient.dart';

enum PatientEditingStatusEnum { init, ready, loading, saving, saved }

class PatientEditingState extends Equatable {
  final PatientModel? patient;
  final List<PatientTodoModel>? patientTodo;
  final PatientEditingStatusEnum status;

  const PatientEditingState({
    this.patient,
    this.status = PatientEditingStatusEnum.init,
    this.patientTodo = const [],
  });

  PatientEditingState copyWith({
    PatientModel? patient,
    List<PatientTodoModel>? patientTodo,
    PatientEditingStatusEnum? status
  }) {
    return PatientEditingState(
      patient: patient ?? this.patient,
      patientTodo: patientTodo ?? this.patientTodo,
      status: status ?? this.status,
    );
  }

  PatientEditingState initPatient(PatientModel patient) {
    return copyWith(patient: patient);
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

  PatientEditingState updateTodo(String note) {
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

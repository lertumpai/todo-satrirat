import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';

import '../../db/model/patient.dart';

class PatientItemState extends Equatable {
  final PatientModel patient;
  final List<PatientTodoModel> patientTodos;

  const PatientItemState(
    this.patient,
    this.patientTodos,
  );

  @override
  List<Object?> get props => [
        patient,
      ];
}

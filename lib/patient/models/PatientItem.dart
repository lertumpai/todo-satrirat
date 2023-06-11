import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';

import '../../db/model/patient.dart';

class PatientItemState extends Equatable {
  final PatientModel patient;
  final List<PatientTodoModel> patientTodos;
  final List<PatientImageModel> patientImages;

  const PatientItemState({
    required this.patient,
    required this.patientTodos,
    required this.patientImages,
  });

  @override
  List<Object?> get props => [
        patient,
        patientTodos,
        patientImages,
      ];
}

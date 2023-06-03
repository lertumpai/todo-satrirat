import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientEditingState extends Equatable {
  final Patient? patient;

  const PatientEditingState({
    this.patient
  });

  updatePatient(Patient patient) {
    return PatientEditingState(
      patient: patient,
    );
  }

  @override
  List<Object?> get props => [
    patient,
  ];
}

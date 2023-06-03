import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientEditingState extends Equatable {
  final PatientModel? patient;

  const PatientEditingState({
    this.patient
  });

  updatePatient(PatientModel patient) {
    return PatientEditingState(
      patient: patient,
    );
  }

  @override
  List<Object?> get props => [
    patient,
  ];
}

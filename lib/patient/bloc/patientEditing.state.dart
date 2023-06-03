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

  updateHn(String hn) {
    patient!.hn = hn;
    return PatientEditingState(
      patient: patient,
    );
  }

  updateNote(String note) {
    patient!.note = note;
    return PatientEditingState(
      patient: patient,
    );
  }

  @override
  List<Object?> get props => [
    patient,
  ];
}

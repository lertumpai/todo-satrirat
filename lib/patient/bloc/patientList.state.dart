import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientListState extends Equatable {
  final List<Patient> patients;

  const PatientListState({
    this.patients = const []
  });

  updatePatients(List<Patient> patients) {
    return PatientListState(
      patients: patients,
    );
  }

  @override
  List<Object?> get props => [
    patients,
  ];
}

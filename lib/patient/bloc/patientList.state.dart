import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientManagementState extends Equatable {
  final List<Patient> patients;

  const PatientManagementState({
    this.patients = const []
  });

  updatePatients(List<Patient> patients) {
    return PatientManagementState(
      patients: patients,
    );
  }

  @override
  List<Object?> get props => [
    patients,
  ];
}

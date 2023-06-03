import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientListState extends Equatable {
  final List<PatientModel> patients;

  const PatientListState({
    this.patients = const []
  });

  updatePatients(List<PatientModel> patients) {
    return PatientListState(
      patients: patients,
    );
  }

  @override
  List<Object?> get props => [
    patients,
  ];
}

import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

enum PatientListStatusEnum { init, loading, ready }

class PatientListState extends Equatable {
  final List<PatientModel> patients;
  final PatientListStatusEnum status;

  const PatientListState({
    this.patients = const [],
    this.status = PatientListStatusEnum.init,
  });

  PatientListState updatePatients(List<PatientModel> patients) {
    return PatientListState(
        patients: patients,
        status: status
    );
  }

  PatientListState updateStatus(PatientListStatusEnum status) {
    return PatientListState(
        patients: patients,
        status: status
    );
  }

  @override
  List<Object?> get props => [
    patients,
    status,
  ];
}

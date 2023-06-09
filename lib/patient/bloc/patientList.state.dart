import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';
import '../models/PatientItem.dart';

enum PatientListStatusEnum { init, loading, searching, ready }

class PatientListState extends Equatable {
  final List<PatientItemState> patients;
  final PatientListStatusEnum status;

  const PatientListState({
    this.patients = const [],
    this.status = PatientListStatusEnum.init,
  });

  PatientListState updatePatients(List<PatientItemState> patients) {
    return PatientListState(patients: patients, status: status);
  }

  PatientListState updateStatus(PatientListStatusEnum status) {
    return PatientListState(patients: patients, status: status);
  }

  @override
  List<Object?> get props => [
        patients,
        status,
      ];
}

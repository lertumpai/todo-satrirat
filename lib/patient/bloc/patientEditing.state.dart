import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

enum PatientEditingStatusEnum { init, ready, loading, saving, saved }

class PatientEditingState extends Equatable {
  final PatientModel? patient;
  final PatientEditingStatusEnum status;

  const PatientEditingState({
    this.patient,
    this.status = PatientEditingStatusEnum.init,
  });

  PatientEditingState updatePatient(PatientModel patient) {
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  PatientEditingState updateHn(String hn) {
    patient!.hn = hn;
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  PatientEditingState updateNote(String note) {
    patient!.note = note;
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  PatientEditingState updateStatus(PatientEditingStatusEnum status) {
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  @override
  List<Object?> get props => [
    patient,
    status,
  ];
}

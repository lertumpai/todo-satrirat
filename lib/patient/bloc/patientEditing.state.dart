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

  PatientEditingState initPatient(PatientModel patient) {
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  PatientEditingState updateHn(String hn) {
    final now = DateTime.now();
    patient!.updatedAt = now;
    patient!.hn = hn;
    return PatientEditingState(
      patient: patient,
      status: status,
    );
  }

  PatientEditingState updateNote(String note) {
    final now = DateTime.now();
    patient!.updatedAt = now;
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

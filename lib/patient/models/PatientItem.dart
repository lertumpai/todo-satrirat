import 'package:equatable/equatable.dart';

import '../../db/model/patient.dart';

class PatientItemState extends Equatable {
  final PatientModel patient;

  const PatientItemState(
    this.patient,
  );

  @override
  List<Object?> get props => [
        patient,
      ];
}

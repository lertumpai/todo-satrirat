import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/patient/patientImage.dart';

class PatientImageList extends StatelessWidget {
  final List<PatientImageModel?> patientImages;

  // final Function(int) onDeletePatientImage;

  const PatientImageList({
    super.key,
    required this.patientImages,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return PatientImage(patientImage: patientImages[index]!);
      },
      separatorBuilder: (context, i) => const SizedBox(height: 10),
      itemCount: patientImages.length,
    );
  }
}

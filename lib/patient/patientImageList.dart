import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/patient/patientImage.dart';

class PatientImageList extends StatelessWidget {
  final List<PatientImageModel?> patientImages;
  final Function(PatientImageModel) onDeletePatientImage;

  const PatientImageList({
    super.key,
    required this.patientImages,
    required this.onDeletePatientImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return PatientImage(
              patientImage: patientImages[index]!,
              onDeletePatientImage: onDeletePatientImage);
        },
        separatorBuilder: (context, i) => const SizedBox(height: 10),
        itemCount: patientImages.length,
      ),
    );
  }
}

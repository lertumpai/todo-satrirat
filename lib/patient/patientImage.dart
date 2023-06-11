import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';

class PatientImage extends StatelessWidget {
  final PatientImageModel patientImage;

  // final Function(int) onDeletePatientImage;

  const PatientImage({
    super.key,
    required this.patientImage,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.memory(
        base64Decode(patientImage.image!),
        fit: BoxFit.contain,
      ),
    );
  }
}

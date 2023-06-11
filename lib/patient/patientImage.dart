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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.black26, width: 2)),
      height: 500,
      child: Image.memory(
        base64Decode(patientImage.image!),
        fit: BoxFit.contain,
      ),
    );
  }
}

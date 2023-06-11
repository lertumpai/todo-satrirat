import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';

class PatientImage extends StatelessWidget {
  final PatientImageModel patientImage;
  final Function(PatientImageModel) onDeletePatientImage;

  const PatientImage({
    super.key,
    required this.patientImage,
    required this.onDeletePatientImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.black26, width: 2)),
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.memory(
            base64Decode(patientImage.image!),
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      onDeletePatientImage(patientImage);
                    },
                    icon: const Icon(Icons.clear_rounded),
                    color: Colors.red.shade500,
                    highlightColor: Colors.white,
                    iconSize: 30,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

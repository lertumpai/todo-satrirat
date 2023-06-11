import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/patient/patientImageList.dart';

import '../utils/image.dart';
import 'bloc/patientEditing.cubit.dart';
import 'bloc/patientEditing.state.dart';

class PatientImageZoomablePage extends StatelessWidget {
  final String? image;

  const PatientImageZoomablePage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
      ),
      body: PhotoView(
        imageProvider: MemoryImage(base64Decode(image!)),
      ),
    );
  }
}

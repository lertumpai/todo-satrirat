import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_satrirat/patient/patientImageList.dart';

import '../utils/image.dart';
import 'bloc/patientEditing.cubit.dart';
import 'bloc/patientEditing.state.dart';

class PatientImageEditablePage extends StatelessWidget {
  const PatientImageEditablePage({super.key});

  @override
  Widget build(BuildContext context) {
    void onAddImages(List<String> images) {
      context.read<PatientEditingCubit>().addImages(images);
    }

    void pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );

      if (result != null) {
        List<String> selectedImages = await Future.wait(
            result.paths.map((path) async => await imageToBase64(File(path!))));
        onAddImages(selectedImages);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(
              onPressed: pickFile,
              icon: const Icon(Icons.add_photo_alternate_outlined)),
          const SizedBox(width: 10),
        ],
      ),
      body: BlocBuilder<PatientEditingCubit, PatientEditingState>(
          builder: (context, state) {
        return PatientImageList(patientImages: state.patientImages);
      }),
    );
  }
}

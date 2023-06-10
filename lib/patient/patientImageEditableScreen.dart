import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PatientImageEditablePage extends StatefulWidget {
  const PatientImageEditablePage({
    super.key,
  });

  @override
  State<PatientImageEditablePage> createState() =>
      _PatientImageEditablePageState();
}

class _PatientImageEditablePageState extends State<PatientImageEditablePage> {
  List<String> images = [];

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      List<String> selectedImages = await Future.wait(
          result.paths.map((path) async => await imageToBase64(File(path!))));
      setState(() {
        images = images + selectedImages;
      });
    }
  }

  Future<String> imageToBase64(File imageFile) async {
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    return base64Image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App หมูอ้วงบันทึกงาน'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save)),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          TextButton(onPressed: pickFile, child: const Text("Add")),
          images.isNotEmpty
              ? Expanded(
                  child: Image.memory(
                    base64Decode(images[0]),
                    fit: BoxFit.contain,
                  ),
                )
              : const Text("loading image")
        ],
      ),
    );
  }
}

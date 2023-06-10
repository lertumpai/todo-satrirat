import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<String> imageToBase64(File imageFile) async {
  Uint8List compressImage = await compressAndGetFile(imageFile);
  String base64Image = base64Encode(compressImage);
  return base64Image;
}

Future<Uint8List> compressAndGetFile(File file) async {
  final result = (await FlutterImageCompress.compressWithFile(
    file.absolute.path,
    quality: 50,
  ))!;

  return result;
}

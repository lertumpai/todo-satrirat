import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'model/patient.dart';

class Database {
  static Isar? _instance;

  static Future<Isar?> initialize() async {
    if (_instance == null) {
      final dir = await getApplicationDocumentsDirectory();
      final isar = await Isar.open(
          [PatientSchema],
          directory: dir.path,
          maxSizeMiB: 1024 * 1,
          name: "todo_satrirat"
      );

      _instance = isar;
    }

    return _instance;
  }

  static Isar? get instance {
    return _instance;
  }
}
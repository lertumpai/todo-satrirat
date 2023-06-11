import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_satrirat/db/model/patientImage.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';

import 'model/patient.dart';
import 'model/todo.dart';

class Database {
  static Isar? _instance;

  static Future<Isar?> initialize() async {
    if (_instance == null) {
      final dir = await getApplicationDocumentsDirectory();
      // print("dir>>>> ${dir.absolute}");
      final isar = await Isar.open([
        PatientModelSchema,
        TodoModelSchema,
        PatientTodoModelSchema,
        PatientImageModelSchema
      ], directory: dir.path, maxSizeMiB: 1024 * 30, name: "todo_satrirat");

      _instance = isar;
    }

    return _instance;
  }

  static Isar? get instance {
    return _instance;
  }
}

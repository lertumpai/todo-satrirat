import 'package:isar/isar.dart';

part 'patientTodo.g.dart';

@collection
class TodoModel {
  Id id = Isar.autoIncrement;

  String? name;

  // byte -> 0-255
  short? sequence;
}
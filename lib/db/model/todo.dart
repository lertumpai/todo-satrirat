import 'package:isar/isar.dart';

part 'todo.g.dart';

@collection
class Todo {
  Id id = Isar.autoIncrement;

  String? name;

  // byte -> 0-255
  short? sequence;
}
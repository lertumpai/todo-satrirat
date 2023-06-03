import 'package:isar/isar.dart';

part 'patientTodo.g.dart';

@collection
class PatientTodoModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  int? patientId;

  @Index(type: IndexType.value)
  int? todoId;

  bool? done;
}
import 'package:isar/isar.dart';

part 'patient.g.dart';

@collection
class Patient {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? hn;

  String? note;

  DateTime? createdAt;

  DateTime? updatedAt;
}
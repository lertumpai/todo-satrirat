import 'package:isar/isar.dart';

part 'patientImage.g.dart';

@collection
class PatientImageModel {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  int? patientId;

  String? image;
}

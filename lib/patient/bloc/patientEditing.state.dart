import 'package:equatable/equatable.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';
import 'package:todo_satrirat/patient/patient.dart';

import '../../db/model/patient.dart';
import '../../db/model/patientImage.dart';

enum PatientEditingStatusEnum {
  init,
  ready,
  addingImage,
  loading,
  saving,
  saved,
  toggle,
  updatingPatientTodo
}

class PatientEditingState extends Equatable {
  final PatientModel? patient;
  final List<PatientTodoModel> patientTodos;
  final List<PatientImageModel> patientImages;
  final List<TodoModel> todos;
  final PatientEditingStatusEnum status;

  const PatientEditingState({
    this.patient,
    this.status = PatientEditingStatusEnum.init,
    this.patientTodos = const [],
    this.todos = const [],
    this.patientImages = const [],
  });

  PatientEditingState copyWith(
      {PatientModel? patient,
      List<PatientTodoModel>? patientTodos,
      List<TodoModel>? todos,
      List<PatientImageModel>? patientImages,
      PatientEditingStatusEnum? status}) {
    return PatientEditingState(
      patient: patient ?? this.patient,
      patientTodos: patientTodos ?? this.patientTodos,
      todos: todos ?? this.todos,
      status: status ?? this.status,
      patientImages: patientImages ?? this.patientImages,
    );
  }

  PatientEditingState initPatient(
      {required PatientModel patient,
      required List<PatientTodoModel> patientTodos,
      required List<PatientImageModel> patientImages,
      required List<TodoModel> todos}) {
    return copyWith(
      patient: patient,
      patientTodos: patientTodos,
      todos: todos,
      patientImages: patientImages,
    );
  }

  PatientEditingState updateHn(String hn) {
    patient!.hn = hn;
    return copyWith(patient: patient);
  }

  PatientEditingState updateNote(String note) {
    patient!.note = note;
    return copyWith(patient: patient);
  }

  PatientEditingState updateStatus(PatientEditingStatusEnum status) {
    return copyWith(status: status);
  }

  PatientTodoModel getPatientTodoByTodoId(int todoId) {
    return patientTodos
        .firstWhere((patientTodo) => patientTodo.todoId == todoId);
  }

  PatientEditingState toggleDoneByTodoId(int todoId) {
    final updatedToggle = patientTodos.map((patientTodo) {
      if (patientTodo.todoId == todoId) {
        patientTodo.done = patientTodo.done == true ? false : true;
        return patientTodo;
      }
      return patientTodo;
    }).toList();
    return copyWith(
      patientTodos: updatedToggle,
    );
  }

  PatientEditingState addTodoList(List<int> todoIds) {
    // Remove unselected
    final updatedSelectedPatientTodos = patientTodos
        .where((patientTodo) => todoIds.contains(patientTodo.todoId))
        .toList();

    // Add new selected
    final updateSelectedPatientTodoIds =
        updatedSelectedPatientTodos.map((patientTodo) => patientTodo.todoId);
    for (final todoId in todoIds) {
      if (updateSelectedPatientTodoIds.contains(todoId) == false) {
        final patientTodo = PatientTodoModel();
        patientTodo.todoId = todoId;
        patientTodo.patientId = patient!.id;
        patientTodo.done = false;
        updatedSelectedPatientTodos.add(patientTodo);
      }
    }

    updatedSelectedPatientTodos.sort(
        (PatientTodoModel a, PatientTodoModel b) => a.todoId! - b.todoId!);
    return copyWith(
      patient: patient,
      patientTodos: updatedSelectedPatientTodos,
    );
  }

  PatientEditingState addImage(List<String> images) {
    List<PatientImageModel> newImages = images.map((image) {
      final patientImage = PatientImageModel();
      patientImage.image = image;
      patientImage.patientId = patient?.id;
      return patientImage;
    }).toList();

    final updatedPatientImages = patientImages + newImages;
    return copyWith(patientImages: updatedPatientImages);
  }

  // PatientEditingState removeImage(int index) {
  //   final updatedPatientImages = patientImages.
  //   return copyWith(patientImages: updatedPatientImages);
  // }

  @override
  List<Object?> get props => [
        patient,
        status,
        patientTodos,
        patientImages,
      ];
}

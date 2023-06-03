import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';

import '../../db/db.dart';
import '../../db/model/patient.dart';
import '../../db/model/patientTodo.dart';
import '../../db/model/todo.dart';

typedef TodoListType = List<TodoModel>;

class SettingsCubit extends Cubit<TodoListType> {
  final db = Database.instance;
  final todoRepo = Database.instance?.collection<TodoModel>();
  final patientTodoRepo = Database.instance?.collection<PatientTodoModel>();
  final patientRepo = Database.instance?.collection<PatientModel>();

  SettingsCubit() : super(const []);

  void getAll() async {
    final todos = await todoRepo?.where().findAll();
    emit(todos!);
  }

  void create(String name) async {
    final todo = TodoModel();
    todo.name = name;
    todo.sequence = 0;
    await db?.writeTxn(() async {
      final id = await todoRepo?.put(todo);
      final patients = await patientRepo?.where().findAll();
      await Future.wait(
          patients!.map(
                  (patient) async {
                final patientTodo = PatientTodoModel();
                patientTodo.done = false;
                patientTodo.patientId = patient.id;
                patientTodo.todoId = id;
                return patientTodoRepo?.put(patientTodo);
              }
          )
      );
    });
    getAll();
  }

  void delete(int id) async {
    await db?.writeTxn(() async {
      await todoRepo?.delete(id);
      await patientTodoRepo?.filter().todoIdEqualTo(id).deleteAll();
    });
    getAll();
  }

  void update(int id, String name) async {
    final todo = await todoRepo?.get(id);
    todo?.name = name;
    await db?.writeTxn(() async {
      await todoRepo?.put(todo!);
    });
    getAll();
  }
}
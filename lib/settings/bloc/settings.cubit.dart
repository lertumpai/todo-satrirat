import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';

import '../../db/db.dart';
import '../../db/model/patientTodo.dart';
import '../../db/model/todo.dart';

typedef TodoListType = List<TodoModel>;

class SettingsCubit extends Cubit<TodoListType> {
  final db = Database.instance;
  final todoRepo = Database.instance?.collection<TodoModel>();
  final patientTodoRepo = Database.instance?.collection<PatientTodoModel>();

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
      await todoRepo?.put(todo);
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
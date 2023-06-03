import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';

import '../../db/db.dart';
import '../../db/model/todo.dart';

typedef TodoListType = List<Todo>;

class SettingsCubit extends Cubit<TodoListType> {
  final db = Database.instance;
  final todoRepo = Database.instance?.collection<Todo>();

  SettingsCubit() : super(const []);

  void getAll() async {
    final todos = await todoRepo?.where().findAll();
    emit(todos!);
  }

  void create(String name) async {
    final todo = Todo();
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
    });
    getAll();
  }

  void update(int id, String name) async {
    print("update ${id}");
    final todo = await todoRepo?.get(id);
    todo?.name = name;
    await db?.writeTxn(() async {
      await todoRepo?.put(todo!);
    });
    getAll();
  }
}
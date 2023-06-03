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

  void create() async {
    final todo = Todo();
    todo.name = "name:${DateTime.now().toIso8601String()}";
    todo.sequence = 0;
    await db?.writeTxn(() async {
      await todoRepo?.put(todo);
    });
    // getAll();
  }
}
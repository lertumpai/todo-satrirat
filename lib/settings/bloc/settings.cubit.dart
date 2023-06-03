import 'package:bloc/bloc.dart';
import 'package:isar/isar.dart';

import '../../db/db.dart';
import '../../db/model/todo.dart';

typedef TodoListType = List<Todo>;

class SettingsCubit extends Cubit<TodoListType> {
  final todoRepo = Database.instance?.collection<Todo>();

  SettingsCubit() : super(const []);

  void getAll() async {
    final todos = await todoRepo?.where().findAll();
    print("todos: ${todos}");
    print("todos?.isEmpty: ${todos?.isEmpty}");
    emit(const []);
  }
}
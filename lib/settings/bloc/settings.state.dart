import '../../db/model/todo.dart';


class SettingsState {
  late List<Todo> todos;

  SettingsState({ this.todos = const [] });
}
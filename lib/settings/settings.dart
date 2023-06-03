import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

import '../db/model/todo.dart';

class Settings extends StatelessWidget {
  final Todo todo;
  final Function(int) deleteTodo;
  final Function(int, String) updateTodo;

  const Settings({
    super.key,
    required this.todo,
    required this.deleteTodo,
    required this.updateTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SettingsTodo(
            id: todo.id,
            name: todo.name ?? "",
            updateTodo: updateTodo
        ),
        SettingsDelete(
            id: todo.id,
            deleteTodo: deleteTodo
        ),
      ],
    );
  }
}

class SettingsTodo extends StatefulWidget {
  final String name;
  final int id;
  final Function(int, String) updateTodo;

  const SettingsTodo({
    super.key,
    required this.name,
    required this.id,
    required this.updateTodo
  });

  @override
  State<SettingsTodo> createState() => _SettingsTodoState();
}

class _SettingsTodoState extends State<SettingsTodo> {
  final debounceDuration = const Duration(milliseconds: 500);
  final debouncedFunction = null;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.name;
  }

  void onChange(String v) {
    final key = "settings:${widget.id}";
    EasyDebounce.cancel(key);
    EasyDebounce.debounce(
        key,
        const Duration(seconds: 1),
            () => widget.updateTodo(widget.id, _textEditingController.text)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _textEditingController,
          onChanged: onChange,
          style: const TextStyle(fontSize: 20),
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsDelete extends StatelessWidget {
  final Function(int) deleteTodo;
  final int id;

  const SettingsDelete({
    super.key,
    required this.id,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red.shade500,
      iconSize: 30,
      onPressed: () {
        deleteTodo(id);
      },
    );
  }
}
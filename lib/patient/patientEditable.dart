import 'package:flutter/material.dart';
import 'package:todo_satrirat/db/model/patientTodo.dart';
import 'package:todo_satrirat/db/model/todo.dart';

import '../db/model/patient.dart';

class PatientEditable extends StatelessWidget {
  final PatientModel patient;
  final List<PatientTodoModel> patientTodos;
  final List<TodoModel> todos;
  final Function(int) onTogglePatientTodo;
  final Function(String) onHnChange;
  final Function(String) onNoteChange;
  final Function(List<int> todoIds) onAddTodoList;

  const PatientEditable({
    super.key,
    required this.patient,
    required this.patientTodos,
    required this.todos,
    required this.onTogglePatientTodo,
    required this.onHnChange,
    required this.onNoteChange,
    required this.onAddTodoList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PatientNote(
          patient: patient,
          onHnChange: onHnChange,
          onNoteChange: onNoteChange,
        ),
        const SizedBox(height: 15),
        PatientToggleList(
          patientTodos: patientTodos,
          todos: todos,
          onAddTodoList: onAddTodoList,
          onTogglePatientTodo: onTogglePatientTodo,
        ),
      ],
    );
  }
}

class PatientNote extends StatefulWidget {
  final PatientModel patient;
  final Function(String) onHnChange;
  final Function(String) onNoteChange;

  const PatientNote({
    super.key,
    required this.patient,
    required this.onHnChange,
    required this.onNoteChange,
  });

  @override
  State<PatientNote> createState() => _PatientNoteState();
}

class _PatientNoteState extends State<PatientNote> {
  final TextEditingController _hnController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _hnController.text = widget.patient.hn!;
    _noteController.text = widget.patient.note!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.person, size: 50, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _hnController,
                  onChanged: widget.onHnChange,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.teal.shade200, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.sticky_note_2_outlined,
                size: 50, color: Colors.black54),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  maxLines: 5,
                  minLines: 5,
                  style: const TextStyle(fontSize: 20),
                  controller: _noteController,
                  onChanged: widget.onNoteChange,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.teal.shade200, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class PatientToggleList extends StatelessWidget {
  final List<PatientTodoModel> patientTodos;
  final List<TodoModel> todos;
  final Function(int) onTogglePatientTodo;
  final Function(List<int> todoIds) onAddTodoList;

  const PatientToggleList({
    super.key,
    required this.todos,
    required this.patientTodos,
    required this.onTogglePatientTodo,
    required this.onAddTodoList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Todo list'),
                    backgroundColor: Colors.white,
                    content: TodoListPopup(
                      todos: todos,
                    ),
                    // actions: [
                    //   TextButton(
                    //     onPressed: () => Navigator.pop(context, 'Cancel'),
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all<Color>(
                    //           Colors.red.shade100),
                    //     ),
                    //     child: Text(
                    //       'Cancel',
                    //       style: TextStyle(color: Colors.red.shade500),
                    //     ),
                    //   ),
                    //   TextButton(
                    //     onPressed: () => Navigator.pop(context, 'OK'),
                    //     style: ButtonStyle(
                    //       backgroundColor: MaterialStateProperty.all<Color>(
                    //           Colors.teal.shade100),
                    //     ),
                    //     child: Text(
                    //       'OK',
                    //       style: TextStyle(color: Colors.teal.shade400),
                    //     ),
                    //   ),
                    // ],
                  ),
                ),
            highlightColor: Colors.teal.shade100,
            icon: const Icon(Icons.add_circle_outline_sharp,
                size: 40, color: Colors.black54)),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (index == patientTodos.length) {
                    return const SizedBox(height: 1);
                  }

                  return PatientToggle(
                    name: todos
                        .firstWhere(
                            (todo) => todo.id == patientTodos[index].todoId)
                        .name!,
                    patientTodo: patientTodos[index],
                    onTogglePatientTodo: onTogglePatientTodo,
                  );
                },
                separatorBuilder: (context, i) => const Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
                itemCount: patientTodos.length + 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PatientToggle extends StatelessWidget {
  final String name;
  final PatientTodoModel patientTodo;
  final Function(int) onTogglePatientTodo;

  const PatientToggle({
    super.key,
    required this.name,
    required this.patientTodo,
    required this.onTogglePatientTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Switch(
          activeColor: Colors.teal.shade200,
          value: patientTodo.done!,
          onChanged: (bool value) {
            onTogglePatientTodo(patientTodo.todoId!);
          },
        ),
        const SizedBox(width: 5),
        Flexible(
            child: Text(
          name,
          style: const TextStyle(fontSize: 20),
          overflow: TextOverflow.clip,
        ))
      ],
    );
  }
}

class TodoListPopup extends StatelessWidget {
  final List<TodoModel> todos;

  const TodoListPopup({
    super.key,
    required this.todos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white70,
      ),
      padding: const EdgeInsets.all(10),
      height: 400,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return TodoListCheckbox(
                  todo: todos[index],
                );
              },
              separatorBuilder: (context, i) => const Divider(height: 1),
              itemCount: todos.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red.shade100),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red.shade500),
                ),
              ),
              const SizedBox(width: 5),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.teal.shade100),
                ),
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.teal.shade400),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TodoListCheckbox extends StatefulWidget {
  final TodoModel todo;

  const TodoListCheckbox({
    super.key,
    required this.todo,
  });

  @override
  State<TodoListCheckbox> createState() => _TodoListCheckboxState();
}

class _TodoListCheckboxState extends State<TodoListCheckbox> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCheck = isCheck == true ? false : true;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.all<Color>(Colors.teal.shade300),
            value: isCheck,
            onChanged: (bool? value) {
              setState(() {
                isCheck = isCheck == true ? false : true;
              });
            },
          ),
          Expanded(
            child: Text(
              widget.todo.name!,
              style: const TextStyle(fontSize: 18),
              overflow: TextOverflow.clip,
            ),
          )
        ],
      ),
    );
  }
}

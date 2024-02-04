import 'dart:async';

import 'package:task_repository/task_repository.dart';

class TaskRepository {
  //all the methods related to tasks
  //adding tasks
  //editing tasks
  //deleting tasks

  //bloc doesn't communicate with apis or local databases
  //bloc communicate with repos
  //repos comunicate with apis and local databases

  //streamcontroller for the list of todos
  final _controller = StreamController<List<Task>>.broadcast();

  //list of tasks
  List<Task> _tasks = [];

  //getter for the tasks list
  Stream<List<Task>> get allTodos async* {
    yield* _controller.stream;
  }

  //adding task
  void addTask(Task newTask) {
    _tasks.add(newTask);
    _controller.add(_tasks);
  }

  void editTask(Task task) {
    List<Task> newList = [];
    for (Task todo in _tasks) {
      if (todo.taskId == task.taskId) {
        newList.add(task);
      } else {
        newList.add(todo);
      }
    }

    _tasks = newList;
    _controller.add(_tasks);
  }

  void deleteTask(String id) {
    List<Task> newList = [];
    for (var todo in _tasks) {
      if (todo.taskId != id) {
        newList.add(todo);
      }
    }
    _tasks = newList;
    _controller.add(_tasks);
  }
}

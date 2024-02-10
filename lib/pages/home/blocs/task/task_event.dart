part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

//what are the events?
//1-select category
//2-get all tasks

final class SelectCategory extends TaskEvent {
  SelectCategory(this.category);
  final TaskCategory category;
}

final class SetAllTasks extends TaskEvent {
  SetAllTasks(this.tasks);
  final List<Task> tasks;
}

part of 'add_task_bloc.dart';

enum FormStatus {
  initial,
  success,
  error,
}

final class AddTaskState {
  AddTaskState({
    this.task = '',
    this.taskStatus = TaskStatus.todo,
    this.status = FormStatus.initial,
    this.isLoading = false,
  });
  final FormStatus status;
  final TaskStatus taskStatus;
  final String task;
  final bool isLoading;

  AddTaskState copyWith({
    FormStatus? status,
    TaskStatus? taskStatus,
    String? task,
    bool? isLoading,
  }) =>
      AddTaskState(
        task: task ?? this.task,
        taskStatus: taskStatus ?? this.taskStatus,
        status: status ?? this.status,
        isLoading: isLoading ?? this.isLoading,
      );
}

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:task_repository/task_repository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc(this.taskRepository) : super(AddTaskState()) {
    on<ChangeTaskValue>(_changeTaskValue);
    on<ChangeTaskStatus>(_changeTaskStatus);
    on<Submit>(_submit);
  }

  final TaskRepository taskRepository;

  void _changeTaskValue(ChangeTaskValue event, Emitter<AddTaskState> emit) {
    final newValue = event.task;
    emit(state.copyWith(task: newValue));
  }

  void _changeTaskStatus(ChangeTaskStatus event, Emitter<AddTaskState> emit) {
    final newStatus = event.taskStatus;
    final newState = state.copyWith(taskStatus: newStatus);
    emit(newState);
  }

  void _submit(Submit event, Emitter<AddTaskState> emit) {
    //isloading = true
    emit(state.copyWith(isLoading: true));
    //add new task
    final taskId = Random().nextInt(100000).toString();
    final newTask =
        Task(taskId: taskId, task: state.task, status: state.taskStatus);
    taskRepository.addTask(newTask);
    //if success emit success state
    emit(state.copyWith(status: FormStatus.success, isLoading: false));
  }
}

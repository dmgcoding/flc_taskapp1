import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_repository/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(this.taskRepository) : super(const TaskState(tasks: [])) {
    //register callbacks for each event
    on<SetAllTasks>(_getAllTasks);
    on<SelectCategory>(_selectCategory);

    //listen to task stream from task repository
    taskRepository.allTodos.listen((todosList) {
      add(SetAllTasks(todosList));
    });
  }

  final TaskRepository taskRepository;

  //callback for SetAllTasks event
  void _getAllTasks(SetAllTasks event, Emitter<TaskState> emit) {
    //we get the new list of tasks
    final newTaskList = event.tasks;
    //doesnt change the selected cateogry value
    final newState = state.copyWith(tasks: newTaskList);
    emit(newState);
  }

  //callback for SelectCategory event
  void _selectCategory(SelectCategory event, Emitter<TaskState> emit) {
    //get the category from event props
    final newCategory = event.category;
    //get newstate using new category from copywith method
    final newState = state.copyWith(selectedCategory: newCategory);
    //emit new state
    emit(newState);
  }
}

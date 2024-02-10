import 'package:flc_taskapp1/locator.dart';
import 'package:flc_taskapp1/pages/home/blocs/task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
    this.cat, {
    super.key,
  });

  final TaskCategory cat;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //new event
        final newEvent = SelectCategory(cat);
        //access the bloc
        final bloc = context.read<TaskBloc>();
        //add new event to the bloc
        bloc.add(newEvent);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lc<TaskRepository>().getColorForCategory(cat),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              int amount = 0;
              //calculate amount in here
              final taskList = state.tasks;
              amount = lc<TaskRepository>()
                  .getLengthOfTasksForCategory(cat, taskList);
              return Text(
                lc<TaskRepository>().getTextForCategory(cat, amount),
                style: const TextStyle(color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flc_taskapp1/locator.dart';
import 'package:flc_taskapp1/pages/add_task/bloc/add_task/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    required this.status,
    super.key,
  });

  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<AddTaskBloc>().add(ChangeTaskStatus(status)),
      child: BlocBuilder<AddTaskBloc, AddTaskState>(
        builder: (context, state) {
          final selectedTaskStatus = state.taskStatus;
          final selected = selectedTaskStatus == status;
          return Container(
            width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: lc<TaskRepository>().getColorForTaskStatus(status),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? Colors.black : Colors.transparent,
              ),
            ),
            child: Center(
              child: Text(
                lc<TaskRepository>().getTextForTaskStatus(status),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flc_taskapp1/pages/add_task/add_task.dart';
import 'package:flc_taskapp1/pages/home/blocs/task/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

class TaskCard extends StatelessWidget {
  const TaskCard(
    this.task, {
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Text(task.task),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (cxt) => AddTaskPage(
                    task: task,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<TaskBloc>().add(DeleteTask(task.taskId));
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

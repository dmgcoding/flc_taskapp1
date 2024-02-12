import 'package:flc_taskapp1/locator.dart';
import 'package:flc_taskapp1/pages/add_task/bloc/add_task/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

import 'status_card.dart';
import 'submit_btn.dart';
import 'text_input.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({this.task, super.key});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(lc())..add(SetTaskForEditing(task)),
      lazy: false,
      child: _AddTaskView(
        task: task,
      ),
    );
  }
}

class _AddTaskView extends StatelessWidget {
  const _AddTaskView({this.task, super.key});

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddTaskBloc, AddTaskState>(
      listener: (context, state) {
        if (state.status == FormStatus.success) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(task == null ? 'Add Task' : 'Edit Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              TextInput(
                task: task,
              ),
              const SizedBox(height: 40),
              const Row(
                children: [
                  StatusCard(status: TaskStatus.todo),
                  StatusCard(status: TaskStatus.pending),
                  StatusCard(status: TaskStatus.done),
                ],
              ),
              const SizedBox(height: 40),
              const SubmitBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

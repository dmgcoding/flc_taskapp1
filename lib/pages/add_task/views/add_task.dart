import 'package:flc_taskapp1/locator.dart';
import 'package:flc_taskapp1/pages/add_task/bloc/add_task/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';

import 'status_card.dart';
import 'submit_btn.dart';
import 'text_input.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskBloc(lc()),
      child: const _AddTaskView(),
    );
  }
}

class _AddTaskView extends StatelessWidget {
  const _AddTaskView({super.key});

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
          title: const Text('Add Task'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView(
            children: const [
              SizedBox(height: 20),
              TextInput(),
              SizedBox(height: 40),
              Row(
                children: [
                  StatusCard(status: TaskStatus.todo),
                  StatusCard(status: TaskStatus.pending),
                  StatusCard(status: TaskStatus.done),
                ],
              ),
              SizedBox(height: 40),
              SubmitBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

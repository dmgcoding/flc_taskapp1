import 'package:flc_taskapp1/pages/add_task/bloc/add_task/add_task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) =>
          context.read<AddTaskBloc>().add(ChangeTaskValue(value)),
    );
  }
}

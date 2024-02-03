import 'package:flc_taskapp1/pages/add_task/views/add_task.dart';
import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (cxt) => const AddTaskPage(),
        ),
      ),
      child: const Icon(Icons.add),
    );
  }
}

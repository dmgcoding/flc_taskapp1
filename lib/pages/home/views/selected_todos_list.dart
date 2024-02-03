import 'package:flutter/material.dart';

import 'task_card.dart';

class SelectedTodosList extends StatelessWidget {
  const SelectedTodosList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [1, 2, 3, 4, 5]
          .map(
            (e) => const TaskCard(),
          )
          .toList(),
    );
  }
}

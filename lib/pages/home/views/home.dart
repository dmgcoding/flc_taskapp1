import 'package:flutter/material.dart';

import 'category_card.dart';
import 'fab.dart';
import 'selected_category.dart';
import 'selected_todos_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeView();
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FAB(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: ListView(
          children: const [
            Row(
              children: [
                Expanded(
                  child: CategoryCard(
                    text: '3 Done',
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: CategoryCard(
                    text: '1 pending',
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            CategoryCard(text: '5 To Do', color: Colors.redAccent),
            SizedBox(height: 20),
            SelectedCategory(),
            SizedBox(height: 20),
            SelectedTodosList(),
          ],
        ),
      ),
    );
  }
}

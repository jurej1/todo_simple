import 'package:flutter/material.dart';
import 'package:todo_simple/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddTodoForm.provider(context);
            },
          );
        },
      ),
    );
  }
}

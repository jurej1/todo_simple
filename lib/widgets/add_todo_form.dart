import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_simple/blocs/todo_form/todo_form_bloc.dart';
import 'package:todo_simple/models/todo.dart' as todo;
import 'package:formz/formz.dart';

class AddTodoForm extends StatelessWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  static Widget provider(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoFormBloc(),
      child: const AddTodoForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            'Add Todo',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 10),
          TextFormField(
            style: const TextStyle(),
            decoration: const InputDecoration(
              labelText: 'Enter Todo',
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
            ),
          ),
          const SizedBox(height: 10),
          // ignore: prefer_const_constructors
          Text(
            'Priority',
            style: const TextStyle(fontSize: 25),
          ),
          const Text('from highest to lowest'),
          const SizedBox(height: 10),
          const _PrioritySelector(),
          const Align(
            alignment: Alignment.center,
            child: _SubmitFormButton(),
          ),
        ],
      ),
    );
  }
}

class _PrioritySelector extends StatelessWidget {
  const _PrioritySelector();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 50,
      child: CarouselSlider.builder(
        itemCount: todo.Priority.values.length,
        itemBuilder: (context, index, _) {
          final val = todo.Priority.values[index];

          return Text(val.valToString());
        },
        options: CarouselOptions(
          initialPage: 1,
          enableInfiniteScroll: false,
          viewportFraction: 0.3,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            BlocProvider.of<TodoFormBloc>(context).add(TodoFormPriorityUpdated(todo.Priority.values[index]));
          },
        ),
      ),
    );
  }
}

class _SubmitFormButton extends StatelessWidget {
  const _SubmitFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoFormBloc, TodoFormState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (!state.status.isSubmissionInProgress) {
              BlocProvider.of<TodoFormBloc>(context).add(TodoFormSubmited());
            }
          },
          child: state.status.isSubmissionInProgress ? const CircularProgressIndicator() : const Text('Submit'),
        );
      },
    );
  }
}

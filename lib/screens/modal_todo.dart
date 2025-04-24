import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';
import '../providers/todo_provider.dart';

class TodoModal extends StatelessWidget {
  final String type;
  final Todo? item;
  final TextEditingController _formFieldController = TextEditingController();

  TodoModal({super.key, required this.type, this.item});

  // Method to show the title of the modal depending on the functionality
  Text _buildTitle() {
    switch (type) {
      case 'Add':
        return const Text("Add new todo");
      case 'Edit':
        return const Text("Edit todo");
      case 'Delete':
        return const Text("Delete todo");
      default:
        return const Text("");
    }
  }

  // Method to build the content or body depending on the functionality
  Widget _buildContent(BuildContext context) {
    switch (type) {
      case 'Delete':
        {
          return Text(
            "Are you sure you want to delete '${item!.title}'?",
          );
        }
      // Edit and add will have input field in them
      default:
        return TextField(
          controller: _formFieldController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: item != null ? item!.title : '',
          ),
        );
    }
  }

  TextButton _dialogAction(BuildContext context) {
    return TextButton(
      onPressed: () {
        switch (type) {
          case 'Add':
            {
              // // Instantiate a todo objeect to be inserted, default userID will be 1, the id will be the next id in the list
              // Todo temp =
              //     Todo(completed: false, title: _formFieldController.text);

              // context.read<TodoListProvider>().addTodo(temp);

              // // Remove dialog after adding
              // Navigator.of(context).pop();
              // break;

              // Modify the add method to call the provider method
              Todo temp = Todo(
                  userId: 1,
                  completed: false,
                  title: _formFieldController.text);
              context.read<TodoListProvider>().addTodo(temp);
              Navigator.of(context).pop();

              break;
            }
          case 'Edit':
            {
              context
                  .read<TodoListProvider>()
                  .editTodo(item!, _formFieldController.text);

              // Remove dialog after editing
              Navigator.of(context).pop();
              break;
            }
          case 'Delete':
            {
              context.read<TodoListProvider>().deleteTodo(item!);

              // Remove dialog after editing
              Navigator.of(context).pop();
              break;
            }
        }
      },
      style: TextButton.styleFrom(
        textStyle: Theme.of(context).textTheme.labelLarge,
      ),
      child: Text(type),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _buildTitle(),
      content: _buildContent(context),

      // Contains two buttons - add/edit/delete, and cancel
      actions: <Widget>[
        _dialogAction(context),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text("Cancel"),
        ),
      ],
    );
  }
}

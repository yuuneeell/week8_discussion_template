import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  late Stream<QuerySnapshot> _todosStream;

  TodoListProvider() {
    fetchTodos();
  }

  // getter
  Stream<QuerySnapshot> get todo => _todosStream;

  // TODO: get all todo items from Firestore
  void fetchTodos() {
    notifyListeners();
  }

  // TODO: add todo item and store it in Firestore
  void addTodo(Todo item) {
    notifyListeners();
  }

  // TODO: edit a todo item and update it in Firestore
  void editTodo(Todo item, String newTitle) {
    notifyListeners();
  }

  // TODO: delete a todo item and update it in Firestore
  void deleteTodo(Todo item) {
    notifyListeners();
  }

  // TODO: modify a todo status and update it in Firestore
  void toggleStatus(Todo item, bool status) {
    notifyListeners();
  }
}

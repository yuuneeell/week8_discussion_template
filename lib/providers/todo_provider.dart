import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../api/firebase_todo_api.dart';

class TodoListProvider with ChangeNotifier {
  late FirebaseTodoAPI firebaseService;
  late Stream<QuerySnapshot> _todosStream;

  TodoListProvider() {
    firebaseService = FirebaseTodoAPI();
    fetchTodos();
  }

  // getter
  Stream<QuerySnapshot> get todo => _todosStream;

  // TODO: get all todo items from Firestore
  fetchTodos() {
    _todosStream = firebaseService.getAllTodos();
    notifyListeners();
  }

  // TODO: add todo item and store it in Firestore
  void addTodo(Todo item) async {
    String message = await firebaseService.addTodo(item.toJson(item));
    print(message);
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

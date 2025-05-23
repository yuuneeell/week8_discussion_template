import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTodoAPI {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      await db.collection("todos").add(todo);

      return "Successfully added todo!";
    } on FirebaseException catch (e) {
      return "Failed with error '${e.code}: ${e.message}";
    }
  }

  late FirebaseTodoAPI firebaseService;
  TodoListProvider() {
    firebaseService = FirebaseTodoAPI();
  }

  Stream<QuerySnapshot> getAllTodos() {
    return db.collection("todos").snapshots();
  }
}

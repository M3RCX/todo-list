import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/models/todo.dart';

const todoListKey = 'todo_list';
class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<void> getTodoList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String? jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
  }

  void saveTodoList(List<Todo> todos) {
    final jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
  }
}

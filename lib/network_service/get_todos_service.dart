import 'dart:convert';

import 'package:wordy_app/models/todo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as c;

class TodoNetworkService {
  static Future<List<Todo>> getTodos() async {
    String apiUrl = 'https://jsonplaceholder.typicode.com/todos?_limit=5';
    Todo todo;
    List<Todo> todos = [];
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var todoslist = c.jsonDecode(response.body) as List;
      todos =  todoslist.map((product) =>Todo.fromJson(product)).toList();
      print(todos.length);
    }
    print(response.statusCode);
    return todos;
  }
}

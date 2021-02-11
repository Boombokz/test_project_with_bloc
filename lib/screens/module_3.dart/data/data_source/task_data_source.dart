import 'dart:convert';

import 'package:test_project_for_internship/screens/module_3.dart/model/task.dart';
import 'package:http/http.dart' as http;

class TaskDataSource {
  Future<List<Task>> getTasks() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/todos');

    return (jsonDecode(response.body) as List)
        .map((e) => Task.fromJson(e))
        .toList();
  }
}

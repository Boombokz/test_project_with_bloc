import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';

class PostDataSource {
  String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    http.Response response = await http.get(url);

    return (jsonDecode(response.body) as List)
        .map((element) => Post.fromJson(element))
        .toList();
  }
}

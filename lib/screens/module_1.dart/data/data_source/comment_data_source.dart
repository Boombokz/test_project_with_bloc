import 'dart:convert';

import 'package:test_project_for_internship/screens/module_1.dart/model/comment.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  Future<List<Comment>> getComments(int postId) async {
    http.Response response = await http
        .get("https://jsonplaceholder.typicode.com/comments?postId=$postId");

    return (jsonDecode(response.body) as List)
        .map((e) => Comment.fromJson(e))
        .toList();
  }
}

import 'dart:convert';

import 'package:test_project_for_internship/screens/module_2.dart/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoDataSource {
  Future<List<Photo>> getPhotos(int albumId) async {
    http.Response response = await http
        .get("https://jsonplaceholder.typicode.com/photos?albumId=$albumId");
    return (jsonDecode(response.body) as List)
        .map((e) => Photo.fromJson(e))
        .toList();
  }
}

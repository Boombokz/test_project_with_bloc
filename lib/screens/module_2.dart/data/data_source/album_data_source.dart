import 'dart:convert';

import 'package:test_project_for_internship/screens/module_2.dart/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumDataSource {
  Future<List<Album>> getAlbums() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/albums");
    return (jsonDecode(response.body) as List)
        .map((e) => Album.fromJson(e))
        .toList();
  }
}

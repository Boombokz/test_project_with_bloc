import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project_for_internship/screens/module_4.dart/model/contact.dart';

class ContactDataSource {
  Future<List<Contact>> getContacts() async {
    http.Response response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    return (jsonDecode(response.body) as List)
        .map((e) => Contact.fromJson(e))
        .toList();
  }
}

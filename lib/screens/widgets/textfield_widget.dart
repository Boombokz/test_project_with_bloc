import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget({this.data, this.title, this.address});

  final String data;
  final String title;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: TextEditingController(
          text: address != null ? '$data $address' : data,
        ),
        readOnly: true,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          height: 1.50,
          letterSpacing: 0.01,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            color: Color(0xFF7F78A7),
            fontSize: 12,
            height: 1.33,
            fontWeight: FontWeight.w600,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF7F78A7), width: 1),
          ),
        ),
      ),
    );
  }
}

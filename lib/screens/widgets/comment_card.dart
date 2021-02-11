import 'package:flutter/material.dart';

import 'package:test_project_for_internship/screens/module_1.dart/model/comment.dart';
import 'package:test_project_for_internship/screens/widgets/custom_icons_icons.dart';

class CommentCard extends StatelessWidget {
  CommentCard({this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Color(0xFF221C44),
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 18, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(
                    CustomIcons.vector,
                    size: 16,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  comment.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    height: 1.50,
                    letterSpacing: 0.01,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                comment.body,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                    height: 1.43,
                    letterSpacing: 0.005,
                    fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

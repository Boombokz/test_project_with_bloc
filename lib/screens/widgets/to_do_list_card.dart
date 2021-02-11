import 'package:flutter/material.dart';
import 'package:test_project_for_internship/screens/module_3.dart/model/task.dart';

class ToDoCard extends StatefulWidget {
  ToDoCard({this.isChecked, this.index, this.task});
  final Task task;
  final int index;
  final bool isChecked;
  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 52,
        padding: EdgeInsets.only(left: 25.6, right: 11),
        color: isSelected ? Color(0xFF251E57) : Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF6B5DFF) : Colors.transparent,
                borderRadius: BorderRadius.circular(4),
                border: isSelected
                    ? null
                    : Border.all(
                        color: Color(0xFF7F77A9),
                        width: 3,
                      ),
              ),
              width: 24,
              height: 24,
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 18.6,
                      color: Color(0xFF2F296B),
                    )
                  : null,
            ),
            SizedBox(
              width: 46.3,
            ),
            Flexible(
              child: Text(
                widget.task.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: isSelected
                    ? TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 1.50,
                        letterSpacing: 0.01,
                        fontSize: 16)
                    : TextStyle(
                        color: Colors.white.withOpacity(0.54),
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                        letterSpacing: 0.01,
                        fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

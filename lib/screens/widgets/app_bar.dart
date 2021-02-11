import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({@required this.title});
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 1.40,
          letterSpacing: 0.15,
        ),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color(0xFF322C54),
              Color(0xFF231D49),
            ])),
      ),
    );
  }
}

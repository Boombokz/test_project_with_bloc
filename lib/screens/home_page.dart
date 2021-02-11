import 'package:flutter/material.dart';
import 'package:test_project_for_internship/screens/module_1.dart/screens/post_list.dart';
import 'package:test_project_for_internship/screens/module_2.dart/screens/gallery_page.dart';
import 'package:test_project_for_internship/screens/module_3.dart/screens/to_do_list.dart';
import 'package:test_project_for_internship/screens/module_4.dart/screens/contacts_list.dart';
import 'package:test_project_for_internship/screens/widgets/custom_icons_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  String title = 'News';

  final tabs = [
    PostsList(),
    GalleryPage(),
    ToDoList(),
    ContactsList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0F0B21),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
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
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF322C54), Color(0xFF231D49)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SizedBox(
          height: 58,
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            iconSize: 15,
            selectedFontSize: 9,
            unselectedFontSize: 9,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xFF7F78A7),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            selectedIconTheme: IconThemeData(color: Colors.white),
            items: [
              createBarItem(CustomIcons.news, ' News'),
              createBarItem(CustomIcons.galleryicon, 'Gallery'),
              createBarItem(CustomIcons.checkcontacticon, 'Check'),
              createBarItem(CustomIcons.checkcontacticon, 'Contacts')
            ],
            onTap: (index) {
              onTabTapped(index);
            },
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem createBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 2.25),
        child: Icon(
          icon,
        ),
      ),
      label: label,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
      switch (index) {
        case 0:
          {
            title = 'News';
          }
          break;
        case 1:
          {
            title = 'Gallery';
          }
          break;
        case 2:
          {
            title = 'Check';
          }
          break;
        case 3:
          {
            title = 'Contacts';
          }
          break;
      }
    });
  }
}

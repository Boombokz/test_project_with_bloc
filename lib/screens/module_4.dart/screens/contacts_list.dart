import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_4.dart/bloc/contact_bloc.dart';
import 'package:test_project_for_internship/screens/module_4.dart/screens/contact_page.dart';
import 'package:test_project_for_internship/screens/widgets/custom_icons_icons.dart';

class ContactsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18),
      color: Color(0xFF0F0B21),
      child: BlocProvider<ContactBloc>(
        create: (context) => ContactBloc()..add(ContactLoadEvent()),
        child:
            BlocBuilder<ContactBloc, ContactState>(builder: (context, state) {
          if (state is ContactLoadingState) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is ContactErrorState) {
            return Container(
              child: Center(
                child: Text('Not Found Data'),
              ),
            );
          } else if (state is ContactLoadedState) {
            return ListView.builder(
                itemCount: state.loadedContacts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ContactPage(state.loadedContacts[index])));
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 21, left: 31, right: 31, bottom: 21),
                      child: Row(
                        children: [
                          Icon(
                            CustomIcons.vector,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Text(
                            state.loadedContacts[index].name,
                            style: TextStyle(
                                color: Colors.white,
                                height: 1.50,
                                letterSpacing: 0.01,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Offstage();
          }
        }),
      ),
    );
  }
}

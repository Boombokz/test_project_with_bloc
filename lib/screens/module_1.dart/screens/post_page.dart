import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/comment_bloc/comment_bloc.dart';

import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';
import 'package:test_project_for_internship/screens/module_1.dart/screens/comment_list.dart';
import 'package:test_project_for_internship/screens/widgets/app_bar.dart';
import 'package:test_project_for_internship/screens/widgets/comment_card.dart';

class PostPage extends StatelessWidget {
  PostPage(this.post);

  final Post post;

  String showResultCount(int list) {
    if (list == 1) {
      return '$list result';
    } else {
      return '$list results';
    }
  }

  int itemCountCheck(int count) {
    if (count <= 0) {
      return count;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentBloc>(
        create: (_) => CommentBloc()..add(CommentLoadEvent(post.id)),
        child: Scaffold(
          backgroundColor: Color(0xFF0F0B21),
          appBar: AppBarWidget(
            title: post.title,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 33,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            height: 1.50,
                            letterSpacing: 0.01,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        post.body,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          height: 1.83,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: BlocBuilder<CommentBloc, CommentState>(
                      builder: (context, state) {
                    if (state is CommentLoadingState) {
                      return Container(
                          height: MediaQuery.of(context).size.height - 300,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    } else if (state is CommentErrorState) {
                      return Center(
                        child: Text('Not Found Data'),
                      );
                    } else if (state is CommentLoadedState) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                top: 32, right: 16, left: 16, bottom: 27),
                            child: ListView.builder(
                                itemCount:
                                    itemCountCheck(state.loadedComments.length),
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CommentCard(
                                    comment: state.loadedComments[index],
                                  );
                                }),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CommentList(post),
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF6C63FF),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  left: 25, top: 8, bottom: 8, right: 24),
                              height: 64,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Show me ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.6,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.43,
                                                  letterSpacing: 0.005),
                                            ),
                                            TextSpan(
                                              text: showResultCount(
                                                  state.loadedComments.length),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.6,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1.43,
                                                  letterSpacing: 0.005),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Offstage();
                    }
                  }),
                )
              ],
            ),
          ),
        ));
  }
}

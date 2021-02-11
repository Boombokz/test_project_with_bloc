import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/comment_bloc/comment_bloc.dart';

import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';
import 'package:test_project_for_internship/screens/widgets/app_bar.dart';
import 'package:test_project_for_internship/screens/widgets/comment_card.dart';

class CommentList extends StatelessWidget {
  CommentList(this.post);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CommentBloc>(
        create: (context) => CommentBloc()..add(CommentLoadEvent(post.id)),
        child: Scaffold(
          backgroundColor: Color(0xFF0F0B21),
          appBar: AppBarWidget(
            title: post.title,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: BlocBuilder<CommentBloc, CommentState>(
                  builder: (context, state) {
                if (state is CommentLoadingState) {
                  return Container(
                    height: MediaQuery.of(context).size.height - 100,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CommentErrorState) {
                  return Center(
                    child: Text('Not Found Data'),
                  );
                } else if (state is CommentLoadedState) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 27, left: 16, right: 16, bottom: 4),
                        child: ListView.builder(
                            itemCount: state.loadedComments.length,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CommentCard(
                                comment: state.loadedComments[index],
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return Offstage();
                }
              }),
            ),
          ),
        ));
  }
}

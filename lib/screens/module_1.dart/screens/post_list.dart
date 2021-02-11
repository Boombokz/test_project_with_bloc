import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_1.dart/data/repository/post_repository.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/post_bloc/post_bloc.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/post_bloc/post_event.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/post_bloc/post_state.dart';
import 'package:test_project_for_internship/screens/module_1.dart/screens/post_page.dart';

class PostsList extends StatelessWidget {
  final postsRepository = PostsRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostBloc>(
      create: (_) => PostBloc()..add(PostLoadEvent()),
      child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
        if (state is PostLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PostErrorState) {
          return Center(
            child: Text('Not Found Data'),
          );
        } else if (state is PostLoadedState) {
          return Container(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  itemCount: state.loadedPosts.length,
                  itemBuilder: (_, i) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF221C44),
                      ),
                      margin: EdgeInsets.only(
                          top: 5, left: 16, right: 16, bottom: 5),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Text(
                            state.loadedPosts[i].title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                letterSpacing: 0.01,
                                fontSize: 16),
                          ),
                        ),
                        subtitle: Text(
                          state.loadedPosts[i].body,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              height: 1.43,
                              letterSpacing: 0.005,
                              fontSize: 14),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostPage(
                                state.loadedPosts[i],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }));
        } else {
          return Offstage();
        }
      }),
    );
  }
}

import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<Post> loadedPosts;
  PostLoadedState(this.loadedPosts);
}

class PostErrorState extends PostState {}

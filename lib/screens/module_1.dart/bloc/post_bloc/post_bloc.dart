import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/post_bloc/post_event.dart';
import 'package:test_project_for_internship/screens/module_1.dart/bloc/post_bloc/post_state.dart';
import 'package:test_project_for_internship/screens/module_1.dart/data/repository/post_repository.dart';
import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository postsRepository = PostsRepository();
  PostBloc() : super(PostLoadingState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostLoadEvent) {
      yield PostLoadingState();

      try {
        List<Post> loadedPostList = await postsRepository.getAllPosts();
        yield PostLoadedState(loadedPostList);
      } catch (_) {
        yield PostErrorState();
      }
    }
  }
}

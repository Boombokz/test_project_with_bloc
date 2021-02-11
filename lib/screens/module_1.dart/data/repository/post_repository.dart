import 'package:test_project_for_internship/screens/module_1.dart/data/data_source/post_data_source.dart';
import 'package:test_project_for_internship/screens/module_1.dart/model/post.dart';

class PostsRepository {
  PostDataSource postsDataSource = PostDataSource();
  Future<List<Post>> getAllPosts() => postsDataSource.getPosts();
}

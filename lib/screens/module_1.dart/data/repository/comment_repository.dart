import 'package:test_project_for_internship/screens/module_1.dart/data/data_source/comment_data_source.dart';
import 'package:test_project_for_internship/screens/module_1.dart/model/comment.dart';

class CommentsRepository {
  CommentsRepository({this.postId});
  int postId;

  CommentDataSource commentsDataSource = CommentDataSource();
  Future<List<Comment>> getAllComments(int postId) =>
      commentsDataSource.getComments(postId);
}

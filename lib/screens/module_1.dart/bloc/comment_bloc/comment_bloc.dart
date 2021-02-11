import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_project_for_internship/screens/module_1.dart/data/repository/comment_repository.dart';
import 'package:test_project_for_internship/screens/module_1.dart/model/comment.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentsRepository commentsRepository = CommentsRepository();
  CommentBloc() : super(CommentLoadingState());

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is CommentLoadEvent) {
      yield CommentLoadingState();
      try {
        List<Comment> loadedCommentsList =
            await commentsRepository.getAllComments(event.postId);
        yield CommentLoadedState(loadedCommentsList);
      } catch (_) {
        yield CommentErrorState();
      }
    }
  }
}

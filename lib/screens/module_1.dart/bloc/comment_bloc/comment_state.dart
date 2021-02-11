part of 'comment_bloc.dart';

abstract class CommentState {}

class CommentLoadingState extends CommentState {}

class CommentLoadedState extends CommentState {
  final List<Comment> loadedComments;
  CommentLoadedState(this.loadedComments);
}

class CommentErrorState extends CommentState {}

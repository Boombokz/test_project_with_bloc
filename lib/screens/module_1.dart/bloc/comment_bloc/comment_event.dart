part of 'comment_bloc.dart';

abstract class CommentEvent {}

class CommentLoadEvent extends CommentEvent {
  final int postId;
  CommentLoadEvent(this.postId);
}

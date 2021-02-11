part of 'photo_bloc.dart';

@immutable
abstract class PhotoEvent {}

class PhotoLoadEvent extends PhotoEvent {
  final int albumId;
  PhotoLoadEvent(this.albumId);
}

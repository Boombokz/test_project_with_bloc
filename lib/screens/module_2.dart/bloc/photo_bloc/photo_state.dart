part of 'photo_bloc.dart';

abstract class PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  List<Photo> loadedPhotos;
  PhotoLoadedState(this.loadedPhotos);
}

class PhotoErrorState extends PhotoState {}

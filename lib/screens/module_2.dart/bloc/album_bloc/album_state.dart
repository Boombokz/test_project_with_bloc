part of 'album_bloc.dart';

abstract class AlbumState {}

class AlbumLoadingState extends AlbumState {}

class AlbumErrorState extends AlbumState {}

class AlbumLoadedState extends AlbumState {
  List<Album> loadedAlbums;
  AlbumLoadedState(this.loadedAlbums);
}

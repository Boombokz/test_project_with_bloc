import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/data/repository/album_repository.dart';
import 'package:test_project_for_internship/screens/module_2.dart/data/repository/photo_repository.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/album.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/photo.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository albumRepository = AlbumRepository();
  final PhotoRepository photoRepository = PhotoRepository();
  AlbumBloc() : super(AlbumLoadingState());

  @override
  Stream<AlbumState> mapEventToState(
    AlbumEvent event,
  ) async* {
    if (event is AlbumLoadEvent) {
      yield AlbumLoadingState();
      try {
        List<Album> loadedAlbumsList = await albumRepository.getAllAlbums();
        for (Album album in loadedAlbumsList) {
          final List<Photo> photos =
              await photoRepository.getAllPhotos(album.id);
          album.photos = photos;
        }

        yield AlbumLoadedState(loadedAlbumsList);
      } catch (e) {
        yield AlbumErrorState();
      }
    }
  }
}

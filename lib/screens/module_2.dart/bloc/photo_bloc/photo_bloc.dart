import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project_for_internship/screens/module_2.dart/data/repository/photo_repository.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/photo.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository photoRepository = PhotoRepository();
  PhotoBloc() : super(PhotoLoadingState());

  @override
  Stream<PhotoState> mapEventToState(
    PhotoEvent event,
  ) async* {
    if (event is PhotoLoadEvent) {
      yield PhotoLoadingState();
      try {
        List<Photo> loadedPhotosList =
            await photoRepository.getAllPhotos(event.albumId);
        yield PhotoLoadedState(loadedPhotosList);
      } catch (e) {
        yield PhotoErrorState();
      }
    }
  }
}

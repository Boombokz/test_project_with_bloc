import 'package:test_project_for_internship/screens/module_2.dart/data/data_source/photo_data_source.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/photo.dart';

class PhotoRepository {
  PhotoDataSource photoDataSource = PhotoDataSource();
  Future<List<Photo>> getAllPhotos(int albumId) =>
      photoDataSource.getPhotos(albumId);
}

import 'package:test_project_for_internship/screens/module_2.dart/data/data_source/album_data_source.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/album.dart';

class AlbumRepository {
  AlbumDataSource albumDataSource = AlbumDataSource();
  Future<List<Album>> getAllAlbums() => albumDataSource.getAlbums();
}

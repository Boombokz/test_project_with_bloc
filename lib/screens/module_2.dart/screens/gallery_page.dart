import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/bloc/album_bloc/album_bloc.dart';

import 'package:test_project_for_internship/screens/module_2.dart/screens/album_page.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumBloc>(
      create: (_) => AlbumBloc()..add(AlbumLoadEvent()),
      child: BlocBuilder<AlbumBloc, AlbumState>(builder: (context, state) {
        if (state is AlbumLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AlbumErrorState) {
          return Center(
            child: Text('Not Found Data'),
          );
        } else if (state is AlbumLoadedState) {
          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.loadedAlbums.length,
              padding: EdgeInsets.all(1),
              itemBuilder: (context, index) {
                return GridTile(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlbumPage(
                                album: state.loadedAlbums[index],
                              ),
                            ));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 24),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state
                                .loadedAlbums[index].photos.first.thumbnailUrl),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          state.loadedAlbums[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              letterSpacing: 0.1,
                              height: 1.71,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return Offstage();
        }
      }),
    );
  }
}

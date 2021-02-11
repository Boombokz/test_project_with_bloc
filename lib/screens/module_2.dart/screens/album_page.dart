import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/bloc/photo_bloc/photo_bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/album.dart';
import 'package:test_project_for_internship/screens/module_2.dart/screens/full_screen_picture.dart';
import 'package:test_project_for_internship/screens/widgets/app_bar.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoBloc>(
      create: (context) => PhotoBloc()..add(PhotoLoadEvent(album.id)),
      child: Scaffold(
        backgroundColor: Color(0xFF0F0B21),
        appBar: AppBarWidget(title: album.title),
        body: Container(
          color: Color(0xFF0F0B21),
          child: BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
            if (state is PhotoLoadingState) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is PhotoErrorState) {
              return Container(
                child: Center(
                  child: Text('Not Found Data'),
                ),
              );
            } else if (state is PhotoLoadedState) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: state.loadedPhotos.length,
                padding: EdgeInsets.all(1.0),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FullScreenPicture(state.loadedPhotos[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 11, right: 14, bottom: 9),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${state.loadedPhotos[index].thumbnailUrl}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          state.loadedPhotos[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white,
                              height: 1.33),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Offstage();
            }
          }),
        ),
      ),
    );
  }
}

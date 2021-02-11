import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/bloc/photo_bloc/photo_bloc.dart';
import 'package:test_project_for_internship/screens/module_2.dart/model/photo.dart';
import 'package:test_project_for_internship/screens/widgets/app_bar.dart';

class FullScreenPicture extends StatelessWidget {
  FullScreenPicture(this.photo);

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotoBloc>(
        create: (context) => PhotoBloc()..add(PhotoLoadEvent(photo.id)),
        child: Scaffold(
          backgroundColor: Color(0xFF0F0B21),
          appBar: AppBarWidget(title: photo.title),
          body: BlocBuilder<PhotoBloc, PhotoState>(
            builder: (context, state) {
              if (state is PhotoLoadingState) {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              } else if (state is PhotoErrorState) {
                return Text('Data is not loaded');
              } else if (state is PhotoLoadedState) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${photo.url}'),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              } else {
                return Offstage();
              }
            },
          ),
        ));
  }
}

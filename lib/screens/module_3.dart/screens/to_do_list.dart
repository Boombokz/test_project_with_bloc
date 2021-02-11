import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_for_internship/screens/module_3.dart/bloc/task_bloc.dart';
import 'package:test_project_for_internship/screens/widgets/to_do_list_card.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0F0B21),
      padding: EdgeInsets.only(right: 16, left: 16, top: 17),
      child: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc()..add(TaskLoadEvent()),
        child: BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
          if (state is TaskLoadingState) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is TaskErrorState) {
            return Container(
              child: Center(
                child: Text('Not Found Data'),
              ),
            );
          } else if (state is TaskLoadedState) {
            return ListView.builder(
                itemCount: state.loadedTasks.length,
                itemBuilder: (context, index) {
                  bool isSelected = state.loadedTasks[index].completed;
                  return ToDoCard(
                    isChecked: isSelected,
                    index: index,
                    task: state.loadedTasks[index],
                  );
                });
          } else {
            return Offstage();
          }
        }),
      ),
    );
  }
}

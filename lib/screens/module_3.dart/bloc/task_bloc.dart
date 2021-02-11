import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project_for_internship/screens/module_3.dart/data/repository/task_repository.dart';
import 'package:test_project_for_internship/screens/module_3.dart/model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository = TaskRepository();
  TaskBloc() : super(TaskLoadingState());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if (event is TaskLoadEvent) {
      yield TaskLoadingState();
      try {
        List<Task> loadedTasks = await taskRepository.getAllTasks();
        yield TaskLoadedState(loadedTasks);
      } catch (e) {
        yield TaskErrorState();
      }
    }
  }
}

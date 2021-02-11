part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskLoadingState extends TaskState {}

class TaskLoadedState extends TaskState {
  final List<Task> loadedTasks;
  TaskLoadedState(this.loadedTasks);
}

class TaskErrorState extends TaskState {}

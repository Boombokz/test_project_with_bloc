import 'package:test_project_for_internship/screens/module_3.dart/data/data_source/task_data_source.dart';
import 'package:test_project_for_internship/screens/module_3.dart/model/task.dart';

class TaskRepository {
  TaskDataSource taskDataSource = TaskDataSource();
  Future<List<Task>> getAllTasks() => taskDataSource.getTasks();
}

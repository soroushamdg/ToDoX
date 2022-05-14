import 'package:get/get.dart';
import 'package:todox/model/task.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
}

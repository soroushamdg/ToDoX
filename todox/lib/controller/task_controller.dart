import 'package:get/get.dart';
import 'package:todox/model/task.dart';

class TaskController extends GetxController {
  int editIndex = 0;
  RxBool isEditing = false.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
}

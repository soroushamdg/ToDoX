import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todox/model/task.dart';

class TaskController extends GetxController {
  int editIndex = 0;
  RxBool isEditing = false.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var box = GetStorage();
    if (box.read('tasks') != null) {
      var list = box.read('tasks');
      for (var item in list) {
        tasks.add(TaskModel.fromJson(item));
      }
    }

    ever(tasks, (value) {
      try {
        box.write('tasks', tasks.toJson());
        print('wrote new tasks');
        print(box.read('tasks').toString());
      } catch (e) {
        print('error' + e.toString());
      }
    });
  }
}

import 'package:get/get.dart';
import 'package:todox/controller/task_controller.dart';
import 'package:todox/controller/textfield_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => TaskController());
    Get.put(TextFieldController());
  }
}

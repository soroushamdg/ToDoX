import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  TextEditingController? tasktitle_controller;
  TextEditingController? tasksub_controller;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tasktitle_controller = TextEditingController();
    tasksub_controller = TextEditingController();
  }
}

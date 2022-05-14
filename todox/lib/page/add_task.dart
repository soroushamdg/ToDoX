import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todox/constant/constant.dart';
import 'package:todox/controller/textfield_controller.dart';
import 'package:todox/model/task.dart';

import '../controller/task_controller.dart';
import '../main.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(Colors.white, Brightness.dark);

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddTaskAppBar(),
          TitleWidget(),
          TaskTextField(),
          NoteWidget(),
          CreateButton(),
        ],
      ),
    ));
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 40.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        style: TextButton.styleFrom(
            elevation: 0.0, backgroundColor: kLightBlueColor),
        onPressed: () {
          if (Get.find<TaskController>().isEditing.value) {
            Get.find<TaskController>()
                    .tasks[Get.find<TaskController>().editIndex]
                    .title =
                Get.find<TextFieldController>().tasktitle_controller!.text;
            Get.find<TaskController>()
                    .tasks[Get.find<TaskController>().editIndex]
                    .subtitle =
                Get.find<TextFieldController>().tasksub_controller!.text;
            Get.find<TextFieldController>().tasksub_controller!.clear();
            Get.find<TextFieldController>().tasktitle_controller!.clear();
            Get.back();
          } else {
            Get.find<TaskController>().tasks.add(TaskModel(
                  title:
                      Get.find<TextFieldController>().tasksub_controller!.text,
                  subtitle: Get.find<TextFieldController>()
                      .tasktitle_controller!
                      .text,
                ));

            Get.find<TextFieldController>().tasksub_controller!.clear();
            Get.find<TextFieldController>().tasktitle_controller!.clear();
            Get.back();
          }
        },
        child: Text(
            Get.find<TaskController>().isEditing.value ? 'Edit' : 'Create'),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: TextField(
        controller: Get.find<TextFieldController>().tasksub_controller,
        maxLength: 30,
        cursorColor: kLightBlueColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          counter: Container(),
          hintText: 'Add note',
        ),
      ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: Get.find<TextFieldController>().tasktitle_controller,
        maxLines: 6,
        cursorColor: kLightBlueColor,
        cursorHeight: 40.0,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.grey.shade300,
            ))),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        'What are you planing?',
        textAlign: TextAlign.left,
        style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
      ),
    );
  }
}

class AddTaskAppBar extends StatelessWidget {
  const AddTaskAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(left: 45),
          child: Text(
            Get.find<TaskController>().isEditing.value
                ? 'Edit Task'
                : 'New Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 21.0),
          ),
        )),
        Hero(
          tag: 'floatingactionhero',
          child: Material(
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
          ),
        ),
      ],
    );
  }
}

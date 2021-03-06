import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todox/constant/constant.dart';
import 'package:todox/controller/task_controller.dart';
import 'package:todox/controller/textfield_controller.dart';

import '../main.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(kLightBlueColor, Brightness.light);
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: 'floatingactionhero',
          onPressed: () {
            Get.find<TextFieldController>().tasksub_controller!.clear();
            Get.find<TextFieldController>().tasktitle_controller!.clear();
            Get.find<TaskController>().isEditing.value = false;

            Get.toNamed('/add')!.then((value) => (value) {
                  MyApp.changeColor(kLightBlueColor, Brightness.light);
                });
          },
          child: const Icon(Icons.add),
          backgroundColor: kLightBlueColor,
          elevation: 0.0,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            TopSectionContainer(),
            BottomSectionContainer(),
          ],
        ),
      ),
    );
  }
}

class TopSectionContainer extends StatelessWidget {
  const TopSectionContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 40.0,
              top: 20.0,
            ),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Center(
                  child: Icon(
                Icons.bookmarks,
                color: kLightBlueColor,
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, top: 20.0),
            child: const Text(
              'All',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, top: 5.0),
            child: Obx(
              () => Text(
                '${Get.find<TaskController>().tasks.length} Tasks',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSectionContainer extends StatelessWidget {
  const BottomSectionContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(60.0),
        ),
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 50, top: 20, right: 10),
        child: Obx(
          () => ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Get.find<TaskController>().tasks[index].title),
                  subtitle:
                      Text(Get.find<TaskController>().tasks[index].subtitle),
                  onTap: () {
                    Get.find<TextFieldController>().tasktitle_controller!.text =
                        Get.find<TaskController>().tasks[index].title;
                    Get.find<TextFieldController>().tasksub_controller!.text =
                        Get.find<TaskController>().tasks[index].subtitle;
                    Get.find<TaskController>().isEditing.value = true;
                    Get.find<TaskController>().editIndex = index;
                    Get.toNamed(
                      '/add',
                    );
                  },
                  onLongPress: () {
                    Get.defaultDialog(
                        title: 'Delete?',
                        middleText: 'Delete this item?',
                        textConfirm: 'Delete',
                        confirmTextColor: Colors.redAccent,
                        buttonColor: Colors.white,
                        onConfirm: () {
                          Get.find<TaskController>().tasks.removeAt(index);
                          Get.back();
                        },
                        textCancel: 'No!',
                        cancelTextColor: kLightBlueColor,
                        onCancel: () {
                          Get.back();
                        });
                  },
                  trailing: Checkbox(
                    activeColor: kLightBlueColor,
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    onChanged: (value) {
                      var task = Get.find<TaskController>().tasks[index];
                      task.status = !task.status;
                      Get.find<TaskController>().tasks[index] = task;
                    },
                    value: Get.find<TaskController>().tasks[index].status,
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                    color: kLightBlueColor,
                    height: 1,
                  ),
              itemCount: Get.find<TaskController>().tasks.length),
        ),
      ),
    );
  }
}

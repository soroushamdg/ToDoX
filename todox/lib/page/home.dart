import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todox/constant/constant.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
            child: const Text(
              '23 Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
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
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('title'),
                subtitle: Text('subtitle'),
                onTap: () {},
                trailing: Checkbox(
                  activeColor: kLightBlueColor,
                  side: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onChanged: (value) {},
                  value: true,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: kLightBlueColor,
                  height: 1,
                ),
            itemCount: 5),
      ),
    );
  }
}

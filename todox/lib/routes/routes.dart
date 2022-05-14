import 'package:get/get.dart';
import 'package:todox/page/add_task.dart';
import 'package:todox/page/home.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddTaskScreen()),
      ];
}

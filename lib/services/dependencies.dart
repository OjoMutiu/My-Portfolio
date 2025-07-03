import 'package:get/get.dart';
import 'package:portfolio/controllers/user_controller.dart';


Future<void> initDep() async {
  Get.lazyPut<UserController>(() => UserController());
}

getAllMethods(){
  Get.find<UserController>();
  Get.find<UserController>().getPortfolioProjects();
  Get.find<UserController>().getPortfolioUser();
}
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:get/get.dart';

class Dependancy extends Bindings {
  @override
  void dependencies() {
    //===================================Input Controller============================
    Get.lazyPut(() => InputController(), fenix: true);

  }
}
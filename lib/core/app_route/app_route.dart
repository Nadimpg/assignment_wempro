
import 'package:assignment_wempro/view/screens/input/input_screen/input_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


class AppRoute {
  ///========================Initial Screens======================
  static const String inputScreen = "/input_screen";

  static List<GetPage> routes = [
    ///========================Route Screens======================
    GetPage(name: inputScreen, page: () => InputScreen()),

  ];
}

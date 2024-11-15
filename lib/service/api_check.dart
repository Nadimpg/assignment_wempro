

import 'package:assignment_wempro/helper/prefs_helper.dart';
import 'package:assignment_wempro/utils/app_const.dart';
import 'package:assignment_wempro/utils/snakbar_toastmsg.dart';
import 'package:get/get.dart';



class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) async {
    if (response.statusCode == 401) {
      await SharePrefsHelper.remove(AppConstants.bearerToken);

     // Get.offAllNamed(AppRoute.signInScreen);
    } else {
      showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
    }
  }
}
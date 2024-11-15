import 'package:assignment_wempro/service/api_check.dart';
import 'package:assignment_wempro/service/api_client.dart';
import 'package:assignment_wempro/service/api_url.dart';
import 'package:assignment_wempro/utils/app_const.dart';
import 'package:assignment_wempro/view/screens/input/model/input_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InputController extends GetxController {

  RxList<Map<String, dynamic>> checkValue = <Map<String, dynamic>>[].obs;

  ///<============================= loading ============================>
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///<============================= input method ============================>
 // RxList<Attribute> inputList = <Attribute>[].obs;
  Rx<InputModel> inputModel = InputModel().obs;
  Future<void> getInput() async {
    setRxRequestStatus(Status.loading);
    update();

    try {
      var response =
      await ApiClient.getData(ApiConstant.inputUrl);

      if (response.statusCode == 200) {
        // var data = response.body['jsonResponse'];
        // if (data != null && data['attributes'] != null) {
        //   inputList.value = List<Attribute>.from(
        //       data['attributes']
        //           .map((x) => Attribute.fromJson(x)));
        // }
        // else {
        //  // inputList.clear(); // Clear the list if no data is present
        // }

        inputModel.value = InputModel.fromJson(response.body);
        setRxRequestStatus(Status.completed);
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      update();
      setRxRequestStatus(Status.error);
      debugPrint('Error: $e');
    }
  }

  ///<============================= selected Input list ============================>

  List<String> outputList=[
    "Include Outdoor Area : Single Family",
    "Number of Bedrooms : 2",
    "Number of Bathrooms : 2",
    "Cleaning Frequency : Bi-weekly",
    "Include garage cleaning : yes",
  ];

  @override
  void onInit() {
    getInput();
    super.onInit();
  }
}

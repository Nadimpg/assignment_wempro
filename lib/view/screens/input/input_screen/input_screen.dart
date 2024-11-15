import 'package:assignment_wempro/core/app_route/app_route.dart';
import 'package:assignment_wempro/helper/general_error.dart';
import 'package:assignment_wempro/utils/app_const.dart';
import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:assignment_wempro/view/screens/no_internet/no_internet.dart';
import 'package:assignment_wempro/view/widgets/custom_button/custom_button.dart';
import 'package:assignment_wempro/view/widgets/custom_checkbox/custom_checkbox.dart';
import 'package:assignment_wempro/view/widgets/custom_dropdown/custom_dropdown.dart';
import 'package:assignment_wempro/view/widgets/custom_loader/custom_loader.dart';
import 'package:assignment_wempro/view/widgets/custom_radio_button/custom_radio_button.dart';
import 'package:assignment_wempro/view/widgets/custom_text/custom_text.dart';
import 'package:assignment_wempro/view/widgets/text_field_custom/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomText(
          text: AppStrings.inputTypes,
          fontSize: 16.h,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (controller.rxRequestStatus.value) {
          case Status.loading:
            return const CustomLoader();
          case Status.internetError:
            return NoInternetScreen(onTap: () {
              controller.getInput();
            });
          case Status.error:
            return GeneralErrorScreen(
              onTap: () {
                controller.getInput();
              },
            );
          case Status.completed:
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                children: [
                  ///<========================= input types list ==========================>
                  Column(
                    children: List.generate(
                      controller
                          .inputModel.value.jsonResponse!.attributes!.length,
                      (index) {
                        var inputList = controller
                            .inputModel.value.jsonResponse?.attributes?[index];

                        if (inputList?.type == AppStrings.typeRADIO) {
                          return CustomRadioButtonList(
                            index: index,
                            title: inputList?.title ?? "",
                            options: inputList?.options ?? [],
                          );
                        }
                        if (inputList?.type == AppStrings.typeCHECKBOX) {
                          return CustomCheckboxList(
                            index: index,
                            title: inputList?.title ?? "",
                            options: inputList?.options ?? [],
                          );
                        }
                        if (inputList?.type == AppStrings.typeCHOOSE) {
                          return CustomDropdown(
                            onChanged: (val) {},
                            index: index,
                            title: inputList?.title ?? "",
                            options: inputList?.options ?? [],
                          );
                        }
                        if (inputList?.type == AppStrings.typeINPUT) {
                          return CustomInputField(
                            index: index,
                            title: inputList?.title ?? "",
                          );
                        } else {
                          return Container(); // or other widget for different types
                        }
                      },
                    ),
                  ),

                  SizedBox(
                    height: 24.h,
                  ),

                  ///<========================= submit button ==========================>
                  CustomButton(
                    ontap: () {
                      Get.toNamed(AppRoute.outputScreen);
                    },
                    text: AppStrings.submit,
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}

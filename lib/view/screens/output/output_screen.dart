import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:assignment_wempro/view/widgets/custom_button/custom_button.dart';
import 'package:assignment_wempro/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OutputScreen extends StatelessWidget {
  OutputScreen({super.key});

  InputController controller = Get.find<InputController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          children: [
            ///<======================= selected input ===========================>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: AppStrings.selectedInput,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.h,
                ),
                CustomText(
                  text: '5 items',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.h,
                ),
              ],
            ),

            SizedBox(
              height: 16.h,
            ),

            ///<======================= selected input list ===========================>
            Container(
              padding: EdgeInsets.all(8.sp),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.sp),
              ),
              child: Column(
                children: [
                  Column(
                    children:
                        List.generate(controller.outputList.length, (index) {
                      return Row(
                        children: [
                          ///<======================= Icon ===========================>
                          Icon(
                            Icons.add_box_outlined,
                            size: 18.w,
                            color: Colors.green,
                          ),

                          ///<======================= selected input data ===========================>
                          CustomText(
                            text: controller.outputList[index],
                            left: 8.w,
                          ),
                        ],
                      );
                    }),
                  ),

                  SizedBox(
                    height: 8.h,
                  ),
                  Divider(),
                  SizedBox(
                    height: 8.h,
                  ),

                  ///<======================= edit selection ===========================>
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: AppStrings.editSelection,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.h,
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 18.w,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
        child: CustomButton(
          ontap: () {
            Get.back();
          },
          text: AppStrings.back,
        ),
      ),
    );
  }
}

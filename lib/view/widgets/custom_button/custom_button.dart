
import 'package:assignment_wempro/utils/app_colors.dart';
import 'package:assignment_wempro/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final VoidCallback ontap;
  final String text;
  final double height;
  final double width;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final double elevation;
  final bool isfillColor;

  final bool isText;

  final Widget? content;

  final double fontSize;

  const CustomButton({
    super.key,

    this.textColor = AppColors.white,
    required this.ontap,
    this.text = "Get Started",
    this.height = 48,
    this.width = double.maxFinite,
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.elevation = 0,
    this.isfillColor = true,
    this.isText = true,
    this.content,
    this.fontSize = 14, this.buttonColor=AppColors.green,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
      },
      child: Container(
        margin:
        EdgeInsets.only(top: top, left: left, right: right, bottom: bottom),
        alignment: Alignment.center,
        height: height.h,
        width: width,
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(10.r),
            color:  buttonColor),
        child: isText
            ? CustomText(
          maxLines: 2,
          fontSize: fontSize.w,
          fontWeight: FontWeight.w500,
          color: textColor,
          text: text,
        )
            : content,
      ),
    );
  }
}

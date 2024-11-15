
import 'package:assignment_wempro/view/widgets/custom_button/custom_button.dart';
import 'package:assignment_wempro/view/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';


class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key, required this.onTap});

  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //const CustomImage(imageSrc: AppIcons.wifi),
              const Icon(Icons.wifi,size: 44,),
              const CustomText(
                top: 24,
                bottom: 24,
                maxLines: 3,
                text:
                "No internet connections found. Check your connections, Please try again",
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomButton(
                    text: "Try Again",
                      ontap: () { onTap(); },),
              )
            ],
          ),
        ),
      ),
    );
  }
}
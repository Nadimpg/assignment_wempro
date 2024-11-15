import 'dart:convert';
import 'package:assignment_wempro/utils/app_colors.dart';
import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:assignment_wempro/view/widgets/custom_text_formfield/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomInputField extends StatefulWidget {
  final String title;
  final int index;

  const CustomInputField({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final TextEditingController _controller = TextEditingController();
  final InputController controller = Get.find<InputController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Initialize the text field value if it's already present in inputValue
    final existingEntry = controller.checkValue.firstWhere(
          (entry) =>
      entry[jsonEncode(AppStrings.title)] == jsonEncode(widget.title) &&
          entry[jsonEncode(AppStrings.index)] ==
              jsonEncode(widget.index.toString()),
      orElse: () => {},
    );

    if (existingEntry.isNotEmpty) {
      var value = jsonDecode(existingEntry[jsonEncode(_controller)]);
      if (value is List && value.isNotEmpty) {
        _controller.text = value.first;
        debugPrint(
            "TextFormField Value==============>>>>>>>>>>>>>>${_controller.text}");
      }
    }
  }

  void _updateInputValue(String val) {
    // Construct the new entry
    final newEntry = {
      jsonEncode(AppStrings.title): jsonEncode(widget.title),
      jsonEncode(AppStrings.value): jsonEncode([val]),
      jsonEncode(AppStrings.index): jsonEncode(widget.index.toString()),
    };

    // Remove any existing entry with the same index
    controller.checkValue.removeWhere((entry) =>
    entry[jsonEncode(AppStrings.index)] == jsonEncode(widget.index.toString())
    );

    // Add the new entry to the list
    controller.checkValue.add(newEntry);

    debugPrint('Updated Input Values: ${controller.checkValue}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(

          fillColor: Colors.black12,
          textInputAction: TextInputAction.done,
          textEditingController: _controller,
          onFieldSubmitted: (val) {
            if (val.isNotEmpty) {
              _updateInputValue(val);
            }
          },
          onChanged: (val) {
            if (val.isNotEmpty) {
              _updateInputValue(val);
            }
          },
          fieldBorderColor: Colors.transparent,
          focusBorderColor: AppColors.white,
          hintText: "Type here",
        ),
          SizedBox(height: 16.h
        ),
      ],
    );
  }
}

import 'dart:convert';
import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomRadioButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget selectedWidget;
  final Widget unselectedWidget;

  const CustomRadioButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.selectedWidget,
    required this.unselectedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!value) {
          onChanged(true);
        }
      },
      child: value ? selectedWidget : unselectedWidget,
    );
  }
}

class CustomRadioButtonList extends StatefulWidget {
  final String title;
  final List<String> options;
  final int index;
  const CustomRadioButtonList({
    required this.title,
    required this.options,
    super.key,
    required this.index,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomRadioButtonListState createState() => _CustomRadioButtonListState();
}

class _CustomRadioButtonListState extends State<CustomRadioButtonList> {
  String? _selectedOption;

  InputController controller = Get.find<InputController>();

  @override
  void initState() {
    super.initState();
    _initializeSelectedOption();
  }

  void _initializeSelectedOption() {
    // Initialize selected option based on existing value in homeController.pdfValue
    for (var item in controller.checkValue) {
      if (item[jsonEncode(AppStrings.title)] == jsonEncode(widget.title) &&
          item[jsonEncode(AppStrings.index)] ==
              jsonEncode(widget.index.toString())) {
        var savedValue = item[jsonEncode(AppStrings.value)];

        List<dynamic> decodedList = jsonDecode(savedValue);
        String extractedValue = decodedList.first;
        debugPrint("Radio Value==============>>>>>>>>>>>>>>$extractedValue");

        setState(() {
          _selectedOption = extractedValue;
        });

        break;
      }
    }
  }

  void _handleRadioButtonChanged(String option, bool? value) {
    setState(() {
      _selectedOption = option;

      _printSelectedOption();
    });
  }

  void _printSelectedOption() {
    // Update homeController.pdfValue
    Map<String, dynamic> newValue = {
      jsonEncode(AppStrings.title): jsonEncode(widget.title),
      jsonEncode(AppStrings.value): jsonEncode([_selectedOption]),

      jsonEncode(AppStrings.index): jsonEncode(widget.index.toString())
    };

    bool found = false;
    for (var i = 0; i < controller.checkValue.length; i++) {
      if (controller.checkValue[i][jsonEncode(AppStrings.title)] ==
          jsonEncode(widget.title) &&
          controller.checkValue[i][jsonEncode(AppStrings.index)] ==
              jsonEncode(widget.index.toString())) {
        found = true;
        if (_selectedOption != null) {
          controller.checkValue[i] = newValue;
        } else {
          // Remove the entry if no option is selected
          controller.checkValue.removeAt(i);
        }
        break;
      }
    }

    // If no entry with the same title exists and an option is selected, add the new entry
    if (!found && _selectedOption != null) {
      controller.checkValue.add(newValue);
    }

    // Log the current state
    if (_selectedOption != null) {
      debugPrint('Selected: $_selectedOption');
    } else {
      debugPrint('No option selected');
    }

    debugPrint('Updated pdfValue: ${controller.checkValue}');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Column(
          children: widget.options.map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: CustomRadioButton(
                value: _selectedOption == option,
                onChanged: (value) => _handleRadioButtonChanged(option, value),
                selectedWidget: Row(
                  children: [
                    const Icon(Icons.radio_button_checked,
                        color: Colors.black),
                    const SizedBox(width: 8),
                    Text(option),
                  ],
                ),
                unselectedWidget: Row(
                  children: [
                    const Icon(Icons.radio_button_unchecked,
                        color: Colors.black),
                    const SizedBox(width: 8),
                    Text(option),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
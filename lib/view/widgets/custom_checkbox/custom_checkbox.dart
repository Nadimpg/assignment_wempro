import 'dart:convert';
import 'package:assignment_wempro/utils/app_colors.dart';
import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String option;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.option,
    super.key,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged?.call(_value);
        });
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(4),
              color: _value ? AppColors.blueLightHover : Colors.transparent,
            ),
            child: _value
                ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.black,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(widget.option)),
        ],
      ),
    );
  }
}

class CustomCheckboxList extends StatefulWidget {
  final String title;
  final List<String> options;
  final int index;

  const CustomCheckboxList({
    required this.title,
    required this.options,
    super.key,
    required this.index,
  });

  @override
  _CustomCheckboxListState createState() => _CustomCheckboxListState();
}

class _CustomCheckboxListState extends State<CustomCheckboxList> {
  InputController controller = Get.find<InputController>();

  late Map<String, bool> _selectedOptions;

  @override
  void initState() {
    super.initState();

    _selectedOptions = {for (var option in widget.options) option: false};
    _initializeSelectedOptions();
  }

  void _initializeSelectedOptions() {
    _selectedOptions = {for (var option in widget.options) option: false};

    for (var item in controller.checkValue) {
      if (item[jsonEncode(AppStrings.title)] == jsonEncode(widget.title) &&
          item[jsonEncode(AppStrings.index)] ==
              jsonEncode(widget.index.toString())) {
        List<String> savedOptions =
            List<String>.from(jsonDecode(item[jsonEncode(AppStrings.value)]));
        for (var option in savedOptions) {
          _selectedOptions[option] = true;
        }
        break;
      }
    }
  }

  void _handleCheckboxChanged(String option, bool value) {
    setState(() {
      _selectedOptions[option] = value;
      _updateCheckValue();
    });
  }

  void _updateCheckValue() {
    List<String> selectedOptions = [];
    _selectedOptions.forEach((option, isSelected) {
      if (isSelected) {
        selectedOptions.add(option);
      }
    });

    Map<String, dynamic> newValue = {
      jsonEncode(AppStrings.title): jsonEncode(widget.title),
      jsonEncode(AppStrings.value): jsonEncode(selectedOptions),
      jsonEncode(AppStrings.index): jsonEncode(widget.index.toString()),
    };

    // Remove any existing entry with the same index
    controller.checkValue.removeWhere((item) =>
        item[jsonEncode(AppStrings.index)] ==
        jsonEncode(widget.index.toString()));

    // Add the updated entry
    if (selectedOptions.isNotEmpty) {
      controller.checkValue.add(newValue);
    }

    debugPrint('Selected: ${controller.checkValue}');
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
          maxLines: 3,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 8),
        Column(
          children: widget.options.map((option) {
            final bool currentValue = _selectedOptions[option] ?? false;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomCheckbox(
                value: currentValue,
                onChanged: (value) => _handleCheckboxChanged(option, value),
                option: option,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

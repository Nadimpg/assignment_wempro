import 'dart:convert';
import 'package:assignment_wempro/utils/app_colors.dart';
import 'package:assignment_wempro/utils/app_static_string.dart';
import 'package:assignment_wempro/view/screens/input/controller/input_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropdown extends StatefulWidget {
  final String title;
  final List<String> options;
  final ValueChanged<String?> onChanged;
  final int index;

  const CustomDropdown({
    super.key,
    required this.title,
    required this.options,
    required this.onChanged,
    required this.index,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;
  bool _isOtherSelected = false;
  final TextEditingController _otherController = TextEditingController();
  final InputController controller = Get.find<InputController>();

  @override
  void initState() {
    super.initState();
    // Retrieve the saved value from controller.chooseValue if needed
    for (var item in controller.checkValue) {
      if (item[jsonEncode(AppStrings.title)] == jsonEncode(widget.title) &&
          item[jsonEncode(AppStrings.index)] ==
              jsonEncode(widget.index.toString())) {
        var value = item[jsonEncode(AppStrings.value)];

        // Decode the value correctly
        List<dynamic> decodedList = jsonDecode(value);
        String extractedValue = decodedList.first;
        debugPrint("DropDown Value==============>>>>>>>>>>>>>>$extractedValue");

        _selectedValue = extractedValue;
        if (_selectedValue == 'Others') {
          _isOtherSelected = true;
          _otherController.text = '';
        } else if (!widget.options.contains(_selectedValue)) {
          _isOtherSelected = true;
          _otherController.text = _selectedValue!;
          _selectedValue = 'Others';
        }
        setState(() {});
        break;
      }
    }
  }

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  void _updatePdfValue(String value) {
    Map<String, dynamic> newValue = {
      jsonEncode(AppStrings.title): jsonEncode(widget.title),
      jsonEncode(AppStrings.value): jsonEncode([value]),
      jsonEncode(AppStrings.index): jsonEncode(widget.index.toString()),
    };

    // Remove any existing entry with the same index
    controller.checkValue.removeWhere((item) =>
    item[jsonEncode(AppStrings.index)] == jsonEncode(widget.index.toString()));

    // Add the updated entry
    controller.checkValue.add(newValue);

    debugPrint("${controller.checkValue}");
  }

  @override
  Widget build(BuildContext context) {
    final options = [...widget.options, 'Others'];

    // Ensure the selected value is part of the options
    if (_selectedValue != null &&
        !options.contains(_selectedValue) &&
        _selectedValue != 'Others') {
      _selectedValue = 'Others';
      _isOtherSelected = true;
      _otherController.text = _selectedValue!;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: AppColors.blueNormal,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            value: _isOtherSelected ? 'Others' : _selectedValue,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            hint: const Text(
              'Please Select',
              style: TextStyle(fontSize: 14),
            ),
            items: options
                .toSet()
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
                .toList(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select one value';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                if (value == 'Others') {
                  _isOtherSelected = true;
                  _selectedValue = null;
                  _otherController.clear();
                } else {
                  _isOtherSelected = false;
                  _selectedValue = value;
                  _otherController.clear();
                  _updatePdfValue(value!);
                }
              });
              widget.onChanged(value);
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
          if (_isOtherSelected)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                controller: _otherController,
                decoration: InputDecoration(
                  hintText: 'Type your value here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    _updatePdfValue(value);
                  }
                },
                onChanged: (value) {
                  _updatePdfValue(value);
                },
              ),
            ),
        ],
      ),
    );
  }
}







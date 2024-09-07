import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  const DropDown({super.key, required this.items});

  @override
  // ignore: library_private_types_in_public_api
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: const Text(
              "Select Item",
              style: TextStyle(fontSize: 14, color: Colors.blue),
            ),
            items: widget.items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
                print(selectedValue);
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 240,
            ),
            menuItemStyleData: const MenuItemStyleData(height: 40),
          ),
        ),
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final List<String> items;
  final String selectedItemText;
  final Function(String?) onSelected;

  const DropDown({
    Key? key,
    required this.items,
    required this.selectedItemText,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              widget.selectedItemText,
              style: const TextStyle(fontSize: 14, color: Colors.blue),
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
            value: _selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
              });
              widget.onSelected(newValue);
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

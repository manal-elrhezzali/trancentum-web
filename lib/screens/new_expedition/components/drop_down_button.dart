import 'package:flutter/material.dart';

import '../../../constants.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton(
      {Key key, @required this.dropDownItems, @required this.hintText})
      : super(key: key);
  final List dropDownItems;
  final String hintText;
  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String valueChose;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 44,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: bgColor,
          ),
        ),
        // border: unde/rlineInputBorder,
      ),
      child: DropdownButton(
        hint: Text(
          widget.hintText,
          style: TextStyle(color: whiteColor),
        ),
        dropdownColor: darkBgColor,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: kSecondaryColor,
        ),
        isExpanded: true,
        underline: SizedBox(),
        value: valueChose,
        onChanged: (value) {
          setState(() {
            valueChose = value;
          });
        },
        items: widget.dropDownItems.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(
              valueItem,
              style: TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
      ),
    );
  }
}

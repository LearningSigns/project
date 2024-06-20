import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final bool disabledField;

  CustomTextFormField({
    required this.icon,
    required this.iconColor,
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.onChanged,
    required this.disabledField
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: TextFormField(
        controller: controller,
        autocorrect: false,
        enabled: disabledField,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: false,
          icon: Icon(icon),
          iconColor: iconColor,
          fillColor: Colors.white,
          hintText: hintText,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelAlignment: FloatingLabelAlignment.start,
        ),
        style: TextStyle(
          color: iconColor, // Assuming ColorsApp.textColor is used for text color
        ),
      ),
    );
  }
}

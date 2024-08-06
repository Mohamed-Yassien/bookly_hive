import 'package:bookly_hive/utils/app_theme.dart';
import 'package:bookly_hive/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.controller,
  });

  final String hintText;
  final int maxLines;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: buildBorder(context),
        enabledBorder: buildBorder(context),
        focusedBorder: buildBorder(context, color: kPrimaryColor),
        hintText: hintText,
      ),
      validator: (val) {
        if (val?.isEmpty ?? true) {
          return "Field is Required";
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
    );
  }

  OutlineInputBorder buildBorder(context, {Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color ??
            (!AppTheme.isDarkTheme(context) ? Colors.black : Colors.white),
      ),
    );
  }
}

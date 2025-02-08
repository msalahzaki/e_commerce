import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? borderColor ;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  int? maxLines;
  TextEditingController? controller;
  Widget? prefixIcon;
  MyValidator validator;
  Widget? suffixIcon;
  bool obscureText;
  TextInputType keyboardType ;
  CustomTextField({super.key, this.borderColor, required this.hintText,
    this.labelText, this.hintStyle, this.prefixIcon, this.suffixIcon, this.labelStyle,
  this.style, this.obscureText = false, this.maxLines, this.validator,
    this.controller, this.keyboardType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      obscuringCharacter: '*',
      cursorColor: AppColor.black,
      maxLines: maxLines ?? 1,
      style: style ?? AppStyles.normal16black,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? AppStyles.normal16gray,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:  BorderSide(
                color: Colors.red,
                width: 2
            )
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: Colors.red,
                width: 2
            )
        ),
      ),
    );
  }
}

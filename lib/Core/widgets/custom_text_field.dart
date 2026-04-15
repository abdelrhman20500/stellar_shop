import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    required this.label, this.keyboardType, required this.textEditingController,
    this.prefixIcon, this.suffixIcon, this.maxLength,
  });

  final String label;
  final TextInputType? keyboardType;
  final TextEditingController textEditingController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength:maxLength ,
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        prefixStyle: const TextStyle(color: Color(0xFFFF6B00)),
        suffixIcon: suffixIcon,
        suffixStyle: const TextStyle(color: Color(0xFFFF6B00)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFFF6B00), width: 2),
        ),
      ),
    );
  }
}
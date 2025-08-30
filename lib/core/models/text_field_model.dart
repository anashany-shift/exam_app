import 'package:flutter/material.dart';

class TextFormFieldModel {
  final String? label;
  final String hint;
  final TextInputType? keyboardType;
  bool obscureText;
  final Icon? suffixIcon;
  final String? Function(String?)?validator;
 final  void Function(String)?onChanged;
 final double? border;


  TextFormFieldModel(
      { this.suffixIcon,
        this.border,
     this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  });
}
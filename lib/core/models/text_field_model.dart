import 'package:flutter/material.dart';

class TextFormFieldModel {
  final String? label;
  final String hint;
  final Widget? suffix;
  final TextInputType? keyboardType;
  bool obscureText;
  final Icon? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final double? border;
  final TextEditingController? controller;

  TextFormFieldModel({
    this.suffixIcon,
    this.suffix,
    this.controller,
    this.border,
    this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  });
}

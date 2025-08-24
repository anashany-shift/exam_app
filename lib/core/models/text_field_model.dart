import 'package:flutter/material.dart';

class TextFormFieldModel {
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  bool obscureText;
  final String? Function(String?)?validator;
 final  void Function(String)?onChanged;

  TextFormFieldModel({
    required this.label,
    required this.hint,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  });
}
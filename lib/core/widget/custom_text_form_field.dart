import 'package:flutter/material.dart';

import '../models/text_field_model.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.textFormFieldModel});
  final TextFormFieldModel textFormFieldModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      autovalidateMode:AutovalidateMode.onUserInteraction ,
      onChanged: textFormFieldModel.onChanged,
      validator:textFormFieldModel.validator,
      obscureText: textFormFieldModel.obscureText,
      keyboardType: textFormFieldModel.keyboardType,
      decoration: InputDecoration(
        labelText: textFormFieldModel.label,
        labelStyle: theme.textTheme.bodyMedium,
        hintText: textFormFieldModel.hint,
        hintStyle: theme.textTheme.bodyMedium,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorBorder: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
      ),
    );
  }
}



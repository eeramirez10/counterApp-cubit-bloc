import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final String? errorMessage;
  final bool? obscure;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField(
      {super.key,
      required this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,this.obscure});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(40));
    final borderError =
        border.copyWith(borderSide: BorderSide(color: color.error));

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscure ?? false ,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder:
            border.copyWith(borderSide: BorderSide(color: color.primary)),
        errorBorder: borderError,
        focusedErrorBorder: borderError,
        isDense: true,
        label: Text(label),
        hintText: hint,
        errorText: errorMessage,
        
        // prefixIcon: Icon(Icons.supervised_user_circle, color: color.primary)
      ),
    );
  }
}

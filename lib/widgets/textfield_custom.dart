import 'package:chat_app/core/core.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    this.controller,
    this.labelText,
    this.prefixIcon,
    this.onFieldSubmitted,
    required this.obscureText,
  });

  final TextEditingController? controller;
  final String? labelText;
  final Widget? prefixIcon;
  final Function(String)? onFieldSubmitted;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.darkGrey),
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: AppColors.grey,
        focusedBorder: _outLineInputBorder(),
        border: _outLineInputBorder(),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.darkGrey,
      ),
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      validator: (value) =>
          value == null || value.isEmpty ? AppText.textFieldError : null,
    );
  }

  OutlineInputBorder _outLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide.none,
    );
  }
}

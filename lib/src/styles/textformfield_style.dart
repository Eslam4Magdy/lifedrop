import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextFormFieldStyle extends StatelessWidget {
  const TextFormFieldStyle({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.validator,
    this.textInputType,
    this.textInputFormatter,
  });

  final String label;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100),),
      ),
      validator: validator,
      inputFormatters: textInputFormatter,
    ).paddingOnly(left: 16, right: 16, bottom: 16);
  }
}
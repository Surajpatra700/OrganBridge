
import 'package:flutter/material.dart';

class FormFieldMine extends StatelessWidget {
  const FormFieldMine({
    super.key,
    required this.controller,
    required this.text,
    required this.returnText,
    required this.icon,
    required this.obscureText,
    required this.keyboardType,
  });

  final TextEditingController controller;
  final String text;
  final String returnText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white.withOpacity(0.75)),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.75),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.indigo.shade700,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return returnText;
        } else {
          return null;
        }
      },
    );
  }
}

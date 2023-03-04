import 'package:flutter/material.dart';

class MyTextFields extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const MyTextFields(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  AuthTextFromField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      required this.validator,
      required this.prefixIcon,
      required this.suffixIcon})
      : super(key: key);

  TextEditingController controller = TextEditingController();
  bool obscureText;
  Function validator;
  Widget prefixIcon, suffixIcon;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          hintStyle: const TextStyle(
              color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
          hintText: hintText,
          fillColor: Colors.grey.shade200,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );
  }
}

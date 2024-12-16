import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hinttext;

  final bool obscureText;
  final void Function()? onPressed;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

 

  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.hinttext,
    required this.obscureText,
   
    this.onChanged,
    this.suffixIcon,
    this.validator,
    this.onPressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 370,
        color: Colors.transparent,
        height: 60,
        child: TextFormField(
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: Colors.white.withOpacity(.6),
            filled: true,
            hintText: hinttext,
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
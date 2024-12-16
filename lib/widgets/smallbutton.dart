import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Smallbutton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Smallbutton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 150,
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            const Color(0xC0EB740C).withOpacity(0.5),
          ),
          shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(8),
                right: Radius.circular(8),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 26,
          ),
        ),
      ),
    );
  }
}
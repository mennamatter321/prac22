import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Category extends StatelessWidget {
  Category(this.text, this.ontap, this.img, {super.key});

  String? text;

  String img;
  Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: 80,
        color: const Color(0xffF6F5F2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  img,
                  width: 50,
                  height: 50,
                ),
                const SizedBox(width: 20),
                Text(
                  text!,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.arrow_forward),
              ],
            )
          ],
        ),
      ),
    );
  }
}

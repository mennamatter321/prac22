import 'package:flutter/material.dart';
import 'package:prac22/screens/signin.dart';
import 'package:prac22/widgets/custtombutton.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Coffee Beans by Siede Preis.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Column(
              children: [
                const Image(
                    image: AssetImage(
                        "assets/hot-drink-coffee-cup-svgrepo-com (1).png"),
                    height: 120),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Find the best coffee",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "for you",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 300,
                ),
                CustomButton(
                  text: "Get Started",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Signin(),
                        ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

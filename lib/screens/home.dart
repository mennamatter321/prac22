import 'package:flutter/material.dart';
import 'package:prac22/screens/cartpage.dart';
import 'package:prac22/screens/drink.dart';

// ignore: camel_case_types
class homepage extends StatelessWidget {
  // ignore: use_super_parameters
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F5F2),
      appBar: AppBar(
        title: const Text("Menu", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffF6F5F2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            productCard(context, "Espresso", 5.99,
                "assets/vecteezy_3d-realistic-coffee-cup-coffee-cup-cartoon_21049268.png"),
            productCard(context, "Cappuccino", 6.99,
                "assets/vecteezy_latte-coffee-isolated-illustration_23742396.png"),
            productCard(context, "Macciato", 7.99,
                "assets/vecteezy_cappuccino-coffee-cup-cutout_23522886.png"),
            productCard(context, "Mocha", 8.99,
                "assets/vecteezy_ai-generated-vanilla-latte-latte-with-vanilla-syrup-on_36159545.png"),
            productCard(context, "Latte", 5.49,
                "assets/vecteezy_ai-generated-cups-of-hot-macchiato-coffee-with-transparent_36161843.png"),
            productCard(context, "Antoccino Coffee", 9.9,
                "assets/vecteezy_ai-generated-latte-coffee-with-transparent-background_36161023.png"),
            productCard(context, "Cuban Coffee", 8.49,
                "assets/vecteezy_ai-generated-latte-coffee-with-transparent-background_36161023.png"),
            productCard(context, "Affogato", 2.33,
                "assets/vecteezy_ai-generated-chai-latte-on-transparent-background_36160715.png"),
            productCard(context, "Dalgona Coffee", 5.88,
                "assets/vecteezy_ai-generated-coffee-cup-isolated-on-transparent-background-png_35979547.png"),
            productCard(context, "Cortado", 5.49,
                "assets/vecteezy_ai-generated-cups-of-hot-macchiato-coffee-with-transparent_36161843.png"),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, bottom: 20.0), // مسافة حول الزر
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Checkout();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE1894B),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text(
              "Go to Checkout",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget productCard(
      BuildContext context, String name, double price, String image) {
    return Column(
      children: [
        const Divider(color: Colors.brown, thickness: 0.5),
        ListTile(
          leading: Image.asset(image, width: 50, height: 50),
          title: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Drink(name: name, price: price, image: image);
              }));
            },
            child: Text(name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          subtitle: Text("\$$price",
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ),
      ],
    );
  }
}

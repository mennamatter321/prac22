import 'package:flutter/material.dart';
import 'package:prac22/widgets/cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = Cart.items.fold(0, (sum, item) => sum + item["price"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xffF6F5F2),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffF6F5F2),
      body: Cart.items.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: Cart.items.length,
              itemBuilder: (context, index) {
                final item = Cart.items[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(item["image"], width: 50, height: 50),
                    title: Text(item["name"],
                        style: const TextStyle(fontSize: 18)),
                    subtitle: Text("\$${item["price"]}",
                        style: const TextStyle(color: Colors.grey)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          Cart.items.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 700),
          child: ElevatedButton(
            onPressed: () {
              // Here you would typically add logic to handle the payment process
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE1894B),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Text(
              "PAY \$${totalPrice.toStringAsFixed(2)}", // ي
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

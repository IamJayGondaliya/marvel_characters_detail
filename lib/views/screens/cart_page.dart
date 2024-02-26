import 'package:flutter/material.dart';
import 'package:rev_e_com_tanvi/views/screens/home_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Cart Page"),
        actions: [
          IconButton(
            onPressed: () {
              Route newRoute = MaterialPageRoute(
                builder: (context) => const HomePage(),
              );

              Navigator.of(context)
                  .pushAndRemoveUntil(newRoute, (route) => false);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

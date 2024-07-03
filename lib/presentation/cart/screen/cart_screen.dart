import 'package:flutter/material.dart';
import 'package:veflat/presentation/cart/widgets/cart_list_widget.dart';
import 'package:veflat/presentation/cart/widgets/header_cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: () {},
            child: const Center(
              child: Text(
                "Check out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          HeaderCardWidget(),
          CartListWidget(),
        ]),
      ),
    );
  }
}

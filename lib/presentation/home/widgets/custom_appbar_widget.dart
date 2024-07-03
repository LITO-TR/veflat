import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veflat/presentation/cart/screen/cart_screen.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';

class CustomAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return AppBar(
      elevation: 0,
      leading: IconButton(
        splashRadius: 20,
        icon: const Icon(
          FontAwesomeIcons.barsStaggered,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              splashRadius: 20,
              icon: const Icon(
                FontAwesomeIcons.bagShopping,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CartScreen()));
              },
            ),
            if (products.cartProducts!.isNotEmpty)
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    products.cartProducts!.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

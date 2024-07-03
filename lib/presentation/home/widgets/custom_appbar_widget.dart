import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veflat/presentation/cart/screen/cart_screen.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        IconButton(
          splashRadius: 20,
          icon: const Icon(
            FontAwesomeIcons.bagShopping,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

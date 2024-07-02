import 'package:flutter/material.dart';
import 'package:veflat/config/theme/colors_custom.dart';

dynamic productAddedSnackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: ColorsCustom.primaryBlack,
    content: const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 50,
          ),
          Text(
            'Product added to cart!',
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
void showProductAddedSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  Future.delayed(
    const Duration(milliseconds: 500),
    () {
      ScaffoldMessenger.of(context).showSnackBar(productAddedSnackBar);
    },
  );
}

dynamic sameProductAddedSnackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    backgroundColor: ColorsCustom.primaryBlack,
    content: const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 50,
          ),
          Text(
            'Product already in cart!',
            maxLines: 1,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
void showSameProductAddedSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  Future.delayed(
    const Duration(milliseconds: 500),
    () {
      ScaffoldMessenger.of(context).showSnackBar(sameProductAddedSnackBar);
    },
  );
}

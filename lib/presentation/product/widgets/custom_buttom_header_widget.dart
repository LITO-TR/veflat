import 'package:flutter/material.dart';

class CustomHeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const CustomHeaderButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}

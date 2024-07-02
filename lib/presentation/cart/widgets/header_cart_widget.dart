import 'package:flutter/material.dart';

class HeaderCardWidget extends StatefulWidget {
  const HeaderCardWidget({
    super.key,
  });
  @override
  State<HeaderCardWidget> createState() => _HeaderCardWidgetState();
}

class _HeaderCardWidgetState extends State<HeaderCardWidget> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                ),
              ),
            ),
            Text('My Cart',
                style: textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.normal)),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

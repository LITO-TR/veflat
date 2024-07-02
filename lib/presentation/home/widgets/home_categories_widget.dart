import 'package:flutter/material.dart';
import 'package:veflat/config/constants/categories.dart';
import 'package:veflat/config/theme/colors_custom.dart';

class HomeCategoryWidget extends StatefulWidget {
  const HomeCategoryWidget({super.key});

  @override
  State<HomeCategoryWidget> createState() => _HomeCategoryWidgetState();
}

class _HomeCategoryWidgetState extends State<HomeCategoryWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: _selectedIndex == index
                      ? ColorsCustom.primaryBlack
                      : Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: _selectedIndex == index
                        ? ColorsCustom.primaryBlack
                        : ColorsCustom.lightGray,
                  )),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: _selectedIndex == index
                      ? ColorsCustom.primaryWhite
                      : ColorsCustom.darkGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

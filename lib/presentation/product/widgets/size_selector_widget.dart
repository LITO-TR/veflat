import 'package:flutter/material.dart';
import 'package:veflat/config/constants/sizes.dart';
import 'package:veflat/config/theme/colors_custom.dart';

class SizeSelectorWidget extends StatefulWidget {
  const SizeSelectorWidget({super.key, required this.onSelectSize});
  final Function(String) onSelectSize;

  @override
  State<SizeSelectorWidget> createState() => _SizeSelectorWidgetState();
}

class _SizeSelectorWidgetState extends State<SizeSelectorWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Size:  ',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              sizes[_selectedIndex],
              style: textTheme.bodyMedium
                  ?.copyWith(fontSize: 28, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.onSelectSize(sizes[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? ColorsCustom.accentOrange
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: _selectedIndex == index
                            ? ColorsCustom.accentOrange
                            : ColorsCustom.lightGray,
                      )),
                  child: Text(
                    sizes[index],
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:veflat/config/constants/colors.dart';

class ColorsSelectorWidget extends StatefulWidget {
  const ColorsSelectorWidget({super.key});

  @override
  State<ColorsSelectorWidget> createState() => _ColorsSelectorWidgetState();
}

class _ColorsSelectorWidgetState extends State<ColorsSelectorWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Select Color:  ',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              colorNames[_selectedIndex],
              style: textTheme.bodyMedium
                  ?.copyWith(fontSize: 22, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: colors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(colors[index]),
                  ),
                  width: 40,
                  height: 40,
                  child: _selectedIndex == index
                      ? const Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 10,
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

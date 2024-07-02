import 'package:flutter/material.dart';
import 'package:veflat/config/theme/colors_custom.dart';
import 'package:veflat/presentation/home/widgets/home_categories_widget.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Find your Clothes",
            style: textTheme.bodyLarge,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorsCustom.beige,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dec 16 - Dec 31',
                        style: textTheme.bodyMedium?.copyWith(
                            color: ColorsCustom.accentOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        '25% Off',
                        style: textTheme.bodyLarge?.copyWith(fontSize: 32),
                      ),
                      Text(
                        'Super Discount',
                        style: textTheme.bodyMedium?.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: ColorsCustom.primaryBlack,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            'Grab Now',
                            style: textTheme.labelLarge,
                          ))
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/portada.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          const HomeCategoryWidget(),
        ],
      ),
    );
  }
}

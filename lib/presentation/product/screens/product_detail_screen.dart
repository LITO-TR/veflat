import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/config/helper/price_helper.dart';
import 'package:veflat/config/helper/snack_bar_helper.dart';
import 'package:veflat/config/theme/colors_custom.dart';
import 'package:veflat/domain/entities/product_entity.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';
import 'package:veflat/presentation/product/widgets/colors_selector_widget.dart';
import 'package:veflat/presentation/product/widgets/header_product_detail_widget.dart';
import 'package:veflat/presentation/product/widgets/size_selector_widget.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({
    super.key,
    required this.isFavorite,
    required this.product,
    required this.price,
  });
  final bool isFavorite;
  final ProductEntity product;
  final double price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    String selectedSize = 'M';

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.5,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const HeaderProductDetailWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    const Text(
                      '\$144.25',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorsCustom.darkGray,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.15,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsCustom.darkGray,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' (2.6k+ review)',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorsCustom.darkGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizeSelectorWidget(
                  onSelectSize: (size) {
                    selectedSize = size;
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const ColorsSelectorWidget(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsCustom.lightGray,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const ExpansionTile(
                    title: Text('Description'),
                    children: <Widget>[
                      ListTile(title: Text('Some description')),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )),
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
            onTap: () {
              bool added = ref.read(productProvider.notifier).setProductToCart(
                  product, selectedSize, generateRandomNumber(), 1);
              if (!added) {
                showSameProductAddedSnackBar(context);
              } else {
                showProductAddedSnackBar(context);
              }
            },
            child: const Center(
              child: Text(
                "Add to Cart",
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/domain/entities/product_entity.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';
import 'package:veflat/presentation/product/widgets/product_card_widget.dart';

class ProductsListWidget extends ConsumerWidget {
  const ProductsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final productState = ref.watch(productProvider);
    final List<ProductEntity> products = productState.products ?? [];

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return SizedBox(
                  child: ProductCardWidget(
                productEntity: product,
                onFavoritePressed: () {},
              ));
            },
          ),
        ),
      ],
    );
  }
}

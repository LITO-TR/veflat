import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';
import 'package:veflat/presentation/product/widgets/products_list_widget.dart';
import 'package:veflat/presentation/widgets/retry_widget.dart';

class ProductsWidget extends ConsumerWidget {
  const ProductsWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(productProvider);
    return _buildBody(product, ref);
  }
}

Widget _buildBody(ProductState product, WidgetRef ref) {
  if (product.initialLoading) {
    return const Center(child: CircularProgressIndicator(strokeWidth: 2));
  } else if (product.errorMessage.isNotEmpty) {
    return RetryWidget(
      errorMessage: product.errorMessage,
      onPressed: () => ref.read(productProvider.notifier).getAllProducts(),
    );
  } else if (product.products != null && product.products!.isNotEmpty) {
    return const ProductsListWidget();
  } else {
    return const Center(child: Text("No hay productos disponibles."));
  }
}

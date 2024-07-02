import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/domain/entities/cart_product_entity.dart';
import 'package:veflat/presentation/cart/widgets/cart_product_list_card_widget.dart';
import 'package:veflat/presentation/cart/widgets/custom_text_form_field.dart';
import 'package:veflat/presentation/cart/widgets/divider_widget.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';

class CartListWidget extends ConsumerStatefulWidget {
  const CartListWidget({
    super.key,
  });
  @override
  CartListWidgetState createState() => CartListWidgetState();
}

class CartListWidgetState extends ConsumerState<CartListWidget> {
  int _quantity = 1;
  double updateSubTotal(
      List<CartProductEntity> cartProductEntity, int quantity) {
    double subtotal = 0.0;
    for (CartProductEntity product in cartProductEntity) {
      subtotal += product.price * product.quantity;
    }
    setState(() {});
    return subtotal;
  }

  double updateTotal(double subtotal, shipping) {
    return subtotal + shipping;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;
    final productState = ref.watch(productProvider);
    final List<CartProductEntity> productsCart =
        productState.cartProducts ?? [];
    updateSubTotal(productsCart, _quantity);

    const double shipping = 10.0;
    updateTotal(updateSubTotal(productsCart, _quantity), shipping);
    return productState.cartProducts == null ||
            productState.cartProducts!.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                'Cart is empty',
                style: textTheme.bodyLarge,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: size.height * 0.5,
                  child: ListView.builder(
                    itemCount: productsCart.length,
                    itemBuilder: (context, index) {
                      final product = productsCart[index];
                      return SizedBox(
                          child: CartProductListCardWidget(
                        onQuantityChanged: (quantity) {
                          _quantity = quantity;
                          updateSubTotal(productsCart, quantity);
                          updateTotal(updateSubTotal(productsCart, _quantity),
                              shipping);
                        },
                        product: product,
                        size: product.size,
                        price: product.price,
                      ));
                    },
                  ),
                ),
                const CustomTextFormField(
                  hint: 'Apply Promo Code',
                  suffixIcon: Icon(Icons.arrow_forward_ios_rounded),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sub Total',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '€${updateSubTotal(productsCart, _quantity).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '€$shipping',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const DashedDivider(height: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '€${updateTotal(updateSubTotal(productsCart, _quantity), shipping).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
  }
}

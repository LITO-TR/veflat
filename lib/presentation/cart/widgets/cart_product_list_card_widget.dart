import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/config/theme/colors_custom.dart';
import 'package:veflat/domain/entities/cart_product_entity.dart';
import 'package:veflat/presentation/product/providers/product_provider.dart';

class CartProductListCardWidget extends ConsumerStatefulWidget {
  const CartProductListCardWidget({
    super.key,
    required this.onQuantityChanged,
    required this.product,
    required this.size,
    required this.price,
  });

  final CartProductEntity product;
  final String size;
  final double price;
  final Function(int)? onQuantityChanged;

  @override
  CartProductListCardWidgetState createState() =>
      CartProductListCardWidgetState();
}

class CartProductListCardWidgetState
    extends ConsumerState<CartProductListCardWidget> {
  bool isFavorite = false;

  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      elevation: 0,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: size.width * 0.45,
              height: size.height * .2,
              child: Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.product.product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * .2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.product.name,
                          style: const TextStyle(
                            fontSize: 22,
                            color: ColorsCustom.primaryBlack,
                          ),
                        ),
                        Text(
                          'Size ${widget.size}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorsCustom.darkGray,
                          ),
                        ),
                        Text(
                          '\$${widget.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: ColorsCustom.primaryBlack,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity--;
                                widget.onQuantityChanged!(quantity);
                                ref
                                    .read(productProvider.notifier)
                                    .updateProductQuantity(
                                        widget.product.product.id, quantity);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  (Icons.remove),
                                  weight: 2,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                                widget.onQuantityChanged!(quantity);
                                ref
                                    .read(productProvider.notifier)
                                    .updateProductQuantity(
                                        widget.product.product.id, quantity);
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  (Icons.add),
                                  weight: 2,
                                ),
                              ),
                            ),
                          ),
                        ]),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(productProvider.notifier)
                                  .deleteProductFromCart(
                                      widget.product.product.id);
                              widget.onQuantityChanged;
                              ref
                                  .read(productProvider.notifier)
                                  .updateProductQuantity(
                                      widget.product.product.id, quantity);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: ColorsCustom.lightGray,
                              size: 30,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

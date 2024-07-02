import 'package:flutter/material.dart';
import 'package:veflat/config/helper/price_helper.dart';
import 'package:veflat/config/theme/colors_custom.dart';
import 'package:veflat/domain/entities/product_entity.dart';
import 'package:veflat/presentation/product/screens/product_detail_screen.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    super.key,
    required this.onFavoritePressed,
    required this.productEntity,
  });

  final VoidCallback onFavoritePressed;
  final ProductEntity productEntity;

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => ProductDetailScreen(
                      isFavorite: isFavorite,
                      product: widget.productEntity,
                      price: generateRandomNumber(),
                    ))));
      },
      child: Card(
        elevation: 0,
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.5,
                height: size.height * .4,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          widget.productEntity.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Favorite icon
                    Positioned(
                      top: 8.0,
                      right: 8.0,
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.black,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productEntity.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: ColorsCustom.primaryBlack,
                      ),
                    ),
                    Text(
                      '\$ ${generateRandomNumber().toString()}',
                      style: const TextStyle(
                        fontSize: 18,
                        color: ColorsCustom.primaryBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

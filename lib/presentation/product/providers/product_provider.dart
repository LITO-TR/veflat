import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veflat/domain/entities/cart_product_entity.dart';
import 'package:veflat/domain/entities/product_entity.dart';
import 'package:veflat/domain/repositories/product_repository.dart';
import 'package:veflat/infrastructure/errors/errors.dart';
import 'package:veflat/infrastructure/mappers/products_mapper.dart';
import 'package:veflat/infrastructure/repositories/product_repository_impl.dart';

final productQuantityProvider =
    StateProvider.family<int, int>((ref, productId) => 1);

final productProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
  final productRepository = ProductRepositoryImpl();
  return ProductNotifier(
    productRepository: productRepository,
  );
});

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepository productRepository;

  ProductNotifier({
    required this.productRepository,
  }) : super(ProductState());

  Future<void> getAllProducts({bool initialLoading = false}) async {
    try {
      state = state.copyWith(initialLoading: initialLoading);

      final contactsResponse = await productRepository.getAllProducts();
      final listProducts =
          ProductsMapper.productJsonToProductEntityList(contactsResponse);

      _setProducts(listProducts);
      _setLoading(false);
      state = state.copyWith(initialLoading: false);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout("Error no controlado");
    }
  }

  void _setProducts(List<ProductEntity> products) {
    state = state.copyWith(
      products: products,
      errorMessage: "",
    );
  }

  void updateProductQuantity(int productId, int newQuantity) {
    List<CartProductEntity> updatedCart = state.cartProducts!.map((product) {
      if (product.product.id == productId) {
        return CartProductEntity(
            product: product.product,
            quantity: newQuantity,
            price: product.price,
            size: product.size);
      }
      return product;
    }).toList();
    state = state.copyWith(cartProducts: updatedCart);
  }

  bool setProductToCart(
      ProductEntity product, String size, double price, int quantity) {
    final newProduct = CartProductEntity.fromProduct(
      product: product,
      size: size,
      price: price,
      quantity: quantity,
    );

    final currentCart = state.cartProducts ?? [];

    // Verifica si el producto ya existe en el carrito
    for (CartProductEntity existingProduct in currentCart) {
      if (existingProduct.product.id == product.id &&
          existingProduct.size == size) {
        // El producto ya existe en el carrito, no agregar y retornar false
        return false;
      }
    }

    // El producto no existe en el carrito, agregar y retornar true
    final updatedCart = List<CartProductEntity>.from(currentCart)
      ..add(newProduct);
    state = state.copyWith(cartProducts: updatedCart);
    return true;
  }

  void _setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void deleteProductFromCart(int productId) {
    final currentCart = state.cartProducts ?? [];
    final updatedCart = currentCart
        .where((product) => product.product.id != productId)
        .toList();
    state = state.copyWith(cartProducts: updatedCart);
  }

  Future<void> logout([
    String? errorMessage,
    String? response,
  ]) async {
    state = state.copyWith(
      products: null,
      errorMessage: errorMessage ?? "",
      isLoading: false,
      initialLoading: false,
      response: response ?? "",
    );
  }
}

class ProductState {
  final List<ProductEntity>? products;
  final List<CartProductEntity>? cartProducts;

  final String errorMessage;
  final String response;
  final bool isLoading;
  final bool initialLoading;
  ProductState({
    this.products,
    this.cartProducts,
    this.errorMessage = "",
    this.response = "",
    this.isLoading = false,
    this.initialLoading = false,
  });

  ProductState copyWith({
    List<ProductEntity>? products,
    List<CartProductEntity>? cartProducts,
    String? errorMessage,
    String? response,
    bool? isLoading,
    bool? initialLoading,
  }) =>
      ProductState(
        products: products ?? this.products,
        cartProducts: cartProducts ?? this.cartProducts,
        errorMessage: errorMessage ?? this.errorMessage,
        response: response ?? this.response,
        isLoading: isLoading ?? this.isLoading,
        initialLoading: initialLoading ?? this.initialLoading,
      );
}

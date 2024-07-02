import 'package:veflat/infrastructure/models/product_response.dart';

abstract class ProductRepository {
  Future<ProductResponse> getAllProducts();
}

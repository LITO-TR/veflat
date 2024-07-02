import 'package:veflat/infrastructure/models/product_response.dart';

abstract class ProductDataSource {
  Future<ProductResponse> getAllProducts();
}

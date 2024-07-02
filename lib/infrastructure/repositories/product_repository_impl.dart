import 'package:veflat/domain/datasources/product_datasource.dart';
import 'package:veflat/domain/repositories/product_repository.dart';
import 'package:veflat/infrastructure/datasources/product_datasource_impl.dart';
import 'package:veflat/infrastructure/models/product_response.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({ProductDataSource? dataSource})
      : dataSource = dataSource ?? ProductDataSourceImpl();

  @override
  Future<ProductResponse> getAllProducts() {
    return dataSource.getAllProducts();
  }
}

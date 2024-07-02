import 'package:veflat/domain/entities/product_entity.dart';
import 'package:veflat/infrastructure/models/product_response.dart';

class ProductsMapper {
  static List<ProductEntity> productJsonToProductEntityList(
      ProductResponse response) {
    return response.results
        .map((product) => ProductEntity(
              id: product.id,
              name: product.name,
              status: product.status,
              species: product.species,
              type: product.type,
              gender: product.gender,
              origin: product.origin,
              location: product.location,
              image: product.image,
              episode: product.episode,
              url: product.url,
              created: product.created,
            ))
        .toList();
  }
}

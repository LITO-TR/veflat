import 'dart:io';

import 'package:dio/dio.dart';
import 'package:veflat/config/constants/env.dart';
import 'package:veflat/domain/datasources/product_datasource.dart';
import 'package:veflat/infrastructure/errors/errors.dart';
import 'package:veflat/infrastructure/models/product_response.dart';

class ProductDataSourceImpl implements ProductDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiRest));

  @override
  Future<ProductResponse> getAllProducts() async {
    try {
      final response = await dio.get("/api/character");
      final contactsResponse = _jsonToProducts(response.data);
      return contactsResponse;
    } catch (e) {
      throw _handleError(e);
    }
  }

  ProductResponse _jsonToProducts(Map<String, dynamic> json) {
    final contactsResponse = ProductResponse.fromJson(json);
    return contactsResponse;
  }

  CustomError _handleError(dynamic e) {
    if (e is DioException) {
      if (e.response?.statusCode == 200) {
        final errorMessage = e.response?.data["error"];
        if (errorMessage == "invalid token") {
          return CustomError("Token invalido");
        } else {
          return CustomError("Error al validar token: $errorMessage");
        }
      } else if (e.response?.statusCode == 500) {
        return CustomError("Error en el servidor al procesar la solicitud");
      } else if (e.error is HandshakeException || e.error is SocketException) {
        return CustomError("Fallo en la conexión a internet");
      }
    }
    return CustomError("Error no controlado: ${e.toString()}");
  }
}

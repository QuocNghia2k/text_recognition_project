import 'package:dartz/dartz.dart';

import '../../data.dart';
import '../../../core/error/failures.dart';
import '../../responses/product_response.dart';

abstract class IProductRepository {
  Future<Either<Failure, ProductModel?>> getResponse(
      {Map<String, dynamic>? params});

  Future<Either<Failure, ProductResponse>> searchProduct(String value);

  Future<Either<Failure, ProductResponse>> getAllProduct();
}

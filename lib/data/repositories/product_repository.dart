import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../data.dart';
import '../responses/product_response.dart';

class ProductRepository extends IProductRepository {
  final IProductRemoteService remote;
  final INetworkInfo networkInfo;

  ProductRepository({required this.remote, required this.networkInfo});

  @override
  Future<Either<Failure, ProductModel?>> getResponse(
      {Map<String, dynamic>? params}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        final data = await remote.getResponse();
        return Right(data);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, ProductResponse>> searchProduct(String value) async {
    try {
      final data = await remote.searchProduct(value);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, ProductResponse>> getAllProduct() async {
    try {
      final data = await remote.getAllProduct();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}

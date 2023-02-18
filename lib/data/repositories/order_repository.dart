import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../data.dart';

class OrderRepository extends IOrderRepository {
  final IOrderRemoteService remote;
  final INetworkInfo networkInfo;
  final ISharedPreferencesService sharedPreferencesService;

  OrderRepository(
      {required this.remote,
      required this.networkInfo,
      required this.sharedPreferencesService});

  @override
  Future<Either<Failure, OrderModel?>> getListCart() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        String? token = await sharedPreferencesService.getToken();
        if (token != null) {
          final data = await remote.getOrder(token);
          return Right(data);
        }
        return Right(null);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}

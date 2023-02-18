import '../../core/core.dart';
import '../data.dart';
import 'package:dartz/dartz.dart';

class HomeRepository extends IHomeRepository {
  final ICategoryRemoteService remoteService;
  final INetworkInfo networkInfo;
  HomeRepository({required this.remoteService, required this.networkInfo});
  @override
  Future<Either<Failure, CategoryResponse>> getResponse(
      {Map<String, dynamic>? params}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        final remoteData = await remoteService.getResponse();
        return Right(remoteData);
      } else {
        return Left(ConnectNetworkFailure());
      }
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}

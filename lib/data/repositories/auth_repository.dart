import '../data.dart';
import 'package:dartz/dartz.dart';
import '../../core/core.dart';

class AuthRepository implements IAuthRepository {
  final ISharedPreferencesService local;
  final IAuthRemoteService remote;
  final INetworkInfo networkInfo;

  AuthRepository(
      {required this.local, required this.networkInfo, required this.remote});

  @override
  Future<Either<Failure, UserResponse?>> signin(
      String username, String password) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        UserResponse remoteData = await remote.signin(username, password);
        if (remoteData.token != null) {
          local.changeToken(remoteData.token!);
          return Right(remoteData);
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

import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../responses/responses.dart';

abstract class IAuthRepository {
  Future<Either<Failure, UserResponse?>> signin(
      String username, String password);
}

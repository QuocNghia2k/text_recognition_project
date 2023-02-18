import '../../responses/responses.dart';

abstract class IAuthRemoteService {
  Future<UserResponse> signin(String username, String password);
}

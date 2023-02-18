import '../responses/responses.dart';
import 'package:get_it/get_it.dart';

import '../../core/core.dart';
import '../data.dart';

class AuthRemoteService implements IAuthRemoteService {
  late final INetworkUtility _networkUtility;

  AuthRemoteService()
      : _networkUtility = GetIt.I.get<INetworkUtility>(
            instanceName: NetworkConstant.authorizationDomain);

  @override
  Future<UserResponse> signin(String username, String password) async {
    final Map<String, dynamic> user = {
      "token": "hgasdflasehlaweafhsdjhfwe34sdf3",
      "user": {
        "id": "1",
        "name": "nghia",
        "email": "nghia@gmail.com",
        "phoneNumber": "0123456789",
        "urlProfile":
            "http://dev.lecle.vn:9004/uploads/url_Profile_e74108c475.png?updated_at=2022-11-02T07:36:28.354Z"
      }
    };
    return UserResponse.fromJson(user);
  }
}

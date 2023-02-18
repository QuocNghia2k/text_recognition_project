import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class SignInBloc extends BaseBloc<SigninState> {
  final IAuthRepository authRepository;

  SignInBloc(this.authRepository);

  Stream<bool?> get successStream =>
      stateStream.map((event) => event.success).distinct();

  Stream<UserModel?> get checkLogin =>
      stateStream.map((event) => event.user).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<UserModel?> signin(String username, String password) async {
    // emitWaiting(true);
    final responseEither = await authRepository.signin(username, password);
    UserModel? checkLogin = responseEither.fold((failure) {
      emit(SigninState(state: state, error: failure.toString()));
      print(failure.toString());
      return null;
    }, (data) {
      if (data != null) {
        return data.user;
      }
      return null;
    });
    // await Future.delayed(Duration(seconds: 2));
    // emitWaiting(false);

    return checkLogin;
  }

  @override
  void dispose() {
    super.dispose();
  }
}

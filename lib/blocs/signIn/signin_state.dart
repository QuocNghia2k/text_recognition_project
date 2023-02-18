import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class SigninState extends Equatable {
  final bool? success;
  final String? error;
  final UserModel? user;

  SigninState({
    SigninState? state,
    bool? success,
    String? error,
    UserModel? user,
  })  : success = success ?? state?.success,
        error = error ?? state?.error,
        user = user ?? state?.user;

  @override
  List<Object?> get props => [success, error, user];
}

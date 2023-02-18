import 'package:equatable/equatable.dart';

class OnBoadingState extends Equatable {
  final bool? success;
  final String? error;

  OnBoadingState({
    OnBoadingState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}

import 'package:equatable/equatable.dart';

class TextConvertState extends Equatable {
  final bool? success;
  final String? error;

  TextConvertState({
    TextConvertState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}

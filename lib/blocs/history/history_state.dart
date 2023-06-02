import 'package:equatable/equatable.dart';

class HistoryState extends Equatable {
  final bool? success;
  final String? error;

  HistoryState({
    HistoryState? state,
    bool? success,
    String? error,
  })  : success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [success, error];
}

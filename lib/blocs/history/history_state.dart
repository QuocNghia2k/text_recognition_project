import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class HistoryState extends Equatable {
  final bool? success;
  final String? error;
  final List<HistoryModel>? data;

  HistoryState({
    HistoryState? state,
    bool? success,
    String? error,
    List<HistoryModel>? data,
  })  : success = success ?? state?.success,
        error = error ?? state?.error,
        data = data ?? state?.data;

  @override
  List<Object?> get props => [success, error, data];
}

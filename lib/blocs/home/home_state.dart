import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class HomeState extends Equatable {
  final bool? success;
  final String? error;
  final List<CategoryModel>? data;

  HomeState(
      {HomeState? state,
      bool? success,
      String? error,
      List<CategoryModel>? data})
      : success = success ?? state?.success,
        error = error ?? state?.error,
        data = data ?? state?.data;

  @override
  List<Object?> get props => [success, error, data];
}

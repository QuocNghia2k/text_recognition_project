import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class SearchState extends Equatable {
  final bool? success;
  final String? error;
  final List<CategoryModel>? data;
  final List<ProductModel>? dataSearch;

  SearchState(
      {SearchState? state,
      bool? success,
      String? error,
      List<CategoryModel>? data,
      List<ProductModel>? dataSearch})
      : success = success ?? state?.success,
        error = error ?? state?.error,
        data = data ?? state?.data,
        dataSearch = dataSearch ?? state?.dataSearch;

  @override
  List<Object?> get props => [success, error, data, dataSearch];
}

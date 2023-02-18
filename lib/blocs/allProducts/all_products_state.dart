import 'package:equatable/equatable.dart';

import '../../data/data.dart';

class AllProductsState extends Equatable {
  final bool? success;
  final String? error;
  List<ProductModel>? allProduct;

  AllProductsState(
      {AllProductsState? state,
      bool? success,
      String? error,
      List<ProductModel>? allProducts})
      : success = success ?? state?.success,
        error = error ?? state?.error,
        allProduct = allProducts ?? state?.allProduct;

  @override
  // TODO: implement props
  List<Object?> get props => [success, error, allProduct];
}

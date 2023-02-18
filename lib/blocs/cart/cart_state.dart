import 'package:equatable/equatable.dart';
import '../../data/data.dart';

class CartState extends Equatable {
  OrderModel? order;
  final bool? success;
  final String? error;

  CartState({
    CartState? state,
    bool? success,
    String? error,
    OrderModel? order,
  })  : order = order ?? state?.order,
        success = success ?? state?.success,
        error = error ?? state?.error;

  @override
  List<Object?> get props => [order, success, error];
}

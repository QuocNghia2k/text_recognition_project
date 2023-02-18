import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../data.dart';

abstract class IOrderRepository {
  Future<Either<Failure, OrderModel?>> getListCart();
}

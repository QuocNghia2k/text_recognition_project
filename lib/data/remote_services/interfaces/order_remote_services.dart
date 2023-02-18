import '../../data.dart';

abstract class IOrderRemoteService {
  Future<OrderModel> getOrder(String token);
}

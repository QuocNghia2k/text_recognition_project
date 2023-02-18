import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class CartBloc extends BaseBloc<CartState> {
  final IOrderRepository orderRepository;

  CartBloc(this.orderRepository);

  Stream<OrderModel?> get orderStream =>
      stateStream.map((event) => event.order);

  Stream<bool?> get successStream =>
      stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  void initData() {
    emitLoading(true);
    getListCart()
        .then((value) => emit(CartState(state: state, order: value)))
        .catchError((error) => emit(CartState(state: state, error: error)))
        .whenComplete(
          () => emitLoading(false),
        );
  }

  Future<OrderModel?> getListCart() async {
    final productEither = await orderRepository.getListCart();
    return productEither.fold((failure) {
      return Future.error(failure);
    }, (data) {
      return data;
    });
  }
}

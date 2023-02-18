import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class AllProductsBloc extends BaseBloc<AllProductsState> {
  final IProductRepository productRepository;

  AllProductsBloc(this.productRepository);

  Stream<bool?> get successStream =>
      stateStream.map((event) => event.success).distinct();

  Stream<List<ProductModel>?> get allProducts =>
      stateStream.map((event) => event.allProduct).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> initData() async {
    emitLoading(true);
    var products = await productRepository.getAllProduct();
    products.fold((failure) {
      emit(AllProductsState(state: state, error: failure.toString()));
    }, (data) {
      emit(AllProductsState(state: state, allProducts: data.listProduct));
    });
    emitLoading(false);
  }
}

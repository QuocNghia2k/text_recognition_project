import 'dart:async';
import '../../core/core.dart';
import '../../data/data.dart';
import 'product_state.dart';

class ProductBloc extends BaseBloc<ProductState> {
  final IProductRepository productRepository;

  ProductBloc(this.productRepository);

  Stream<int?> get indexImageDisplayHeaderStream =>
      stateStream.map((event) => event.indexImageDisplayHeader);

  Stream<ProductModel?> get productStream =>
      stateStream.map((event) => event.product);

  Stream<int?> get indexSizeNameStream =>
      stateStream.map((event) => event.indexSizeName);

  Stream<int?> get indexSizeStream =>
      stateStream.map((event) => event.indexSize);

  Future<void> initData() async {
    emitLoading(true);
    getProduct()
        .then((value) => emit(ProductState(
            state: state,
            indexImageDisplayHeader: 0,
            product: value,
            indexSizeName: 0,
            indexSize: 0)))
        .catchError((Error) => emit(ProductState(state: state)))
        .whenComplete(
          () => emitLoading(false),
        );
  }

  Future<ProductModel?> getProduct() async {
    final productEither = await productRepository.getResponse();
    return productEither.fold((failure) {
      return Future.error(failure);
    }, (data) {
      return data;
    });
  }

  void setIndexImage(int indexImageDisplayHeader) {
    emit(ProductState(
        state: state, indexImageDisplayHeader: indexImageDisplayHeader));
  }

  void setIndexSizeName(int indexSizeName) {
    emit(
        ProductState(state: state, indexSizeName: indexSizeName, indexSize: 0));
  }

  void setIndexSize(int indexSize) {
    emit(ProductState(state: state, indexSize: indexSize));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

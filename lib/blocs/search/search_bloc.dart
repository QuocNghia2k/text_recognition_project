import '../../core/base/base_bloc.dart';
import '../../data/data.dart';
import 'search_state.dart';

class SearchBloc extends BaseBloc<SearchState> {
  final IHomeRepository _homeRepository;
  final IProductRepository _searchProduct;
  SearchBloc(this._homeRepository, this._searchProduct);

  Stream<bool?> get successStream =>
      stateStream.map((event) => event.success).distinct();
  Stream<List<CategoryModel>?> get listCategory =>
      stateStream.map((event) => event.data);

  Stream<List<ProductModel>?> get listProductSearch =>
      stateStream.map((event) => event.dataSearch);
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  void loadData() {
    emitLoading(true);
    getCategory()
        .then((value) => emit(SearchState(state: state, data: value.category)))
        .catchError((error) => emit(SearchState(state: state, error: error)))
        .whenComplete(() => emitLoading(false));
  }

  Future<CategoryResponse> getCategory() async {
    final listCategoryEither = await _homeRepository.getResponse();
    return listCategoryEither.fold((failure) {
      return Future.error(failure);
    }, (data) {
      return data;
    });
  }

  void searchData(String value) async {
    final listProductEither = await _searchProduct.searchProduct(value);
    listProductEither.fold((failure) {
      emit(SearchState(state: state, error: failure.toString()));
    }, (data) async {
      emit(SearchState(state: state, dataSearch: data.listProduct));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

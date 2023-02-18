import '../../core/core.dart';
import '../../data/data.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final IHomeRepository _homeRepository;

  HomeBloc(this._homeRepository);
  Stream<bool?> get successStream =>
      stateStream.map((event) => event.success).distinct();
  Stream<List<CategoryModel>?> get listCategory =>
      stateStream.map((event) => event.data);
  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  void loadData() {
    emitLoading(true);
    getCategory()
        .then((value) => emit(HomeState(state: state, data: value.category)))
        .catchError((error) => emit(HomeState(state: state, error: error)))
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

  @override
  void dispose() {
    super.dispose();
  }
}

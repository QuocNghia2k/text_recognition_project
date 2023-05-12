import 'package:get_it/get_it.dart';

import '../blocs/blocs.dart';

class BlocDependencies {
  static Future setup(GetIt injector) async {
    injector.registerLazySingleton(() => AppBloc(injector()));
    injector.registerFactory<SplashBloc>(() => SplashBloc(injector()));
    injector.registerFactory<HomeBloc>(() => HomeBloc(injector()));
    injector.registerFactory<SearchBloc>(() => SearchBloc(injector(), injector()));
    injector.registerFactory<ProductBloc>(() => ProductBloc(injector()));
    injector.registerFactory<SignInBloc>(() => SignInBloc(injector()));
    injector.registerFactory<CartBloc>(() => CartBloc(injector()));
    injector.registerFactory<ProfileBloc>(() => ProfileBloc());
    injector.registerFactory<AllProductsBloc>(() => AllProductsBloc(injector()));
    injector.registerFactory<OnBoadingBloc>(() => OnBoadingBloc());
    injector.registerFactory<TextConvertBloc>(() => TextConvertBloc());
    injector.registerFactory<SaveWorldBloc>(() => SaveWorldBloc());
  }
}

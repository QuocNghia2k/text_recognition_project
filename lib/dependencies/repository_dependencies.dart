import 'package:get_it/get_it.dart';

import '../data/data.dart';

class RepositoryDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ISharedPreferencesRepository>(
        () => SharedPreferencesRepository(injector()));
    injector.registerFactory<ISplashRepository>(() => SplashRepository(
          remoteService: injector(),
          localService: injector(),
          networkInfo: injector(),
        ));
    injector.registerFactory<IProductRepository>(() => ProductRepository(
          remote: injector(),
          networkInfo: injector(),
        ));
    injector.registerFactory<IHomeRepository>(
      () => HomeRepository(remoteService: injector(), networkInfo: injector()),
    );
    // injector.registerFactory<IProductRepository>(
    //     () => ProductRepository(productRemoteService: injector()));
    injector.registerFactory<IAuthRepository>(() => AuthRepository(
          networkInfo: injector(),
          local: injector(),
          remote: injector(),
        ));
    injector.registerFactory<IOrderRepository>(() => OrderRepository(
        remote: injector(),
        networkInfo: injector(),
        sharedPreferencesService: injector()));
  }
}

import 'package:get_it/get_it.dart';

import '../data/data.dart';

class RemoteServiceDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<ISplashRemoteService>(() => SplashRemoteService());
    injector
        .registerFactory<ICategoryRemoteService>(() => CategoryRemoteService());
    injector
        .registerFactory<IProductRemoteService>(() => ProductRemoteService());
    injector.registerFactory<IAuthRemoteService>(() => AuthRemoteService());
    injector.registerFactory<IOrderRemoteService>(() => OrderRemoteService());
  }
}

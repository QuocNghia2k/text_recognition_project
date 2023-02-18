import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../pages/pages.dart';
import '../router/router.dart';

class PageDependencies {
  static Future setup(GetIt injector) async {
    injector.registerFactory<Widget>(() => SplashPage(injector()),
        instanceName: Routes.splash);
    injector.registerFactory<Widget>(() => HomePage(injector()),
        instanceName: Routes.home);
    injector.registerFactory<Widget>(() => SearchPage(injector()),
        instanceName: Routes.search);
    injector.registerFactory<Widget>(
        () => MainPage(
              homeBloc: injector(),
              searchBloc: injector(),
              profileBloc: injector(),
            ),
        instanceName: Routes.main);
    injector.registerFactory<Widget>(() => ProductPage(injector()),
        instanceName: Routes.product);
    injector.registerFactory<Widget>(() => SigninPage(injector()),
        instanceName: Routes.signin);
    injector.registerFactory<Widget>(() => CartPage(injector()),
        instanceName: Routes.cart);
    injector.registerFactory<Widget>(() => ProfilePage(injector()),
        instanceName: Routes.profile);
    injector.registerFactory<Widget>(() => AllProductsPage(injector()),
        instanceName: Routes.allProduct);
  }
}
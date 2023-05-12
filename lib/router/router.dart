import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Routes {
  static String get root => '/';
  static String get splash => '/splash';
  static String get main => '/main';
  static String get home => '/home';
  static String get search => '/search';

  static String get product => '/product';

  static String get signin => '/signin';

  static String get cart => '/cart';

  static String get profile => '/profile';

  static String get allProduct => '/allProduct';

  static String get onBoading => '/on_boading';

  static String get textConvert => '/text_convert';

  static String get saveWorld => '/save_world';

  static getRoute(RouteSettings settings) {
    Widget widget;
    if (settings.name == root) {
      return null;
    }
    try {
      widget = GetIt.I.get<Widget>(instanceName: settings.name);
    } catch (e) {
      widget = Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Builder(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Text(
                  '404 NOT FOUND',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      );
    }
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}

import 'package:global_configuration/global_configuration.dart';

import '../enums.dart';

class AppConfig {
  GlobalConfiguration get globalConfiguration => GlobalConfiguration();

  static AppConfig _singleton = AppConfig._internal();

  static AppConfig get instance => _singleton;

  AppConfig._internal();

  Future loadConfig({Environment env = Environment.dev}) async {
    await GlobalConfiguration().loadFromAsset('app_config_${env.name}');
  }

  String get hostUrl => globalConfiguration.get('host_url');
}

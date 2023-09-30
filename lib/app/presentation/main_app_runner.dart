import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../domain/app_builder.dart';
import '../domain/app_runner.dart';
import '../domain/di/init_di.dart';

class MainAppRunner implements AppRunner {
  final String env;

  const MainAppRunner(this.env);

  @override
  Future<void> preloadData() async {
    // init app
    initDi(env);
    // init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    WidgetsFlutterBinding.ensureInitialized();
    await preloadData();
    runApp(appBuilder.buildApp());
  }
}

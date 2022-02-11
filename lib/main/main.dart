import 'package:chuck_norris_app/modules/chuck/data/cache/model/chuck_category_cm.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../app_module/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app_widget/app_widget.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // Hive
  //   ..init((await getApplicationDocumentsDirectory()).path)
  //   ..registerAdapter<ChuckCategoryCM>(ChuckCategoryCMAdapter());

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

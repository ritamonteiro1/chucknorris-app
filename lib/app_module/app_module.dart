import 'package:flutter_modular/flutter_modular.dart';

import '../constants/constant_module_routes.dart';
import '../modules/chuck/module/chuck_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(ConstantsModuleRoutes.initialModule, module: ChuckModule()),
      ];
}

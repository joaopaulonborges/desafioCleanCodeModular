import 'package:desafio_modular_clean_code/app/modules/car_brands/car_brands_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CarBrandsModule()),
  ];
}

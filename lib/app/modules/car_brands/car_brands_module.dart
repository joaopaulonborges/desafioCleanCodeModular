import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:desafio_modular_clean_code/app/core/network/network_info.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/datasources/car_brand_remote_datasource.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/repositories/car_brand_repository_imp.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/usecases/get_car_brand.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/bloc.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/pages/car_brand_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CarBrandsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CarBrandBloc(new GetCarBrand(
        new CarBrandRepositoryImp(new CarBrandRemoteDataSourceImp(),
            new NetworkInfoImpl(new DataConnectionChecker()))))),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CarBrandList()),
  ];
}

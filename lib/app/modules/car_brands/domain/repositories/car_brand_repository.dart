import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';

abstract class CarBrandsRepository {
  Future<Either<Failure, List<CarBrand>>> findBrands(String type);
}

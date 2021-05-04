import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/core/usecases/usecases.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/repositories/car_brand_repository.dart';
import 'package:equatable/equatable.dart';

class GetCarBrand implements UseCase<CarBrand, Params> {
  final CarBrandsRepository carBrandsRepository;

  GetCarBrand(this.carBrandsRepository);

  @override
  Future<Either<Failure, List<CarBrand>>> call(Params params) async {
    return await carBrandsRepository.findBrands(params.type);
  }
}

class Params extends Equatable {
  final String type;

  Params({this.type});

  @override
  List<Object> get props => [type];
}

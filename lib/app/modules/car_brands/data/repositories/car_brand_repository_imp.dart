import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/exceptions.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/core/network/network_info.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/datasources/car_brand_remote_datasource.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/repositories/car_brand_repository.dart';

class CarBrandRepositoryImp implements CarBrandsRepository {
  final CarBrandRemoteDataSource carBrandRemoteDataSource;
  final NetworkInfo networkInfo;

  CarBrandRepositoryImp(
    this.carBrandRemoteDataSource,
    this.networkInfo,
  );

  @override
  Future<Either<Failure, List<CarBrand>>> findBrands(String type) async {
    return await _getCarBrands(type);
  }

  Future<Either<Failure, List<CarBrand>>> _getCarBrands(String type) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await carBrandRemoteDataSource.getCarBrand(type);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}

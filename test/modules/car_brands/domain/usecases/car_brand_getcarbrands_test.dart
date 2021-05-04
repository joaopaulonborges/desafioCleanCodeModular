import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/repositories/car_brand_repository.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/usecases/get_car_brand.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCarBrandRepository extends Mock implements CarBrandsRepository {}

void main() {
  GetCarBrand usecase;
  MockCarBrandRepository mockCarBrandRepository;

  setUp(() {
    mockCarBrandRepository = MockCarBrandRepository();
    usecase = GetCarBrand(mockCarBrandRepository);
  });

  final endpoint = 'carros';

  test(
    'should get car brand for the carros from the repository',
    () async {
      // arrange
      when(mockCarBrandRepository.findBrands(any))
          .thenAnswer((_) async => Right(List<CarBrand>()));
      // act
      final result = await usecase(Params(type: endpoint));
      // assert
      expect(result, isA<Right>());
      expect(result | [], isA<List<CarBrand>>());
      verify(mockCarBrandRepository.findBrands(endpoint));
      verifyNoMoreInteractions(mockCarBrandRepository);
    },
  );
}

import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/exceptions.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/core/network/network_info.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/datasources/car_brand_remote_datasource.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/models/car_brand_model.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/repositories/car_brand_repository_imp.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCarBrandRepository extends Mock implements CarBrandRemoteDataSource {}

class MockRemoteDataSource extends Mock implements CarBrandRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  CarBrandRepositoryImp repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CarBrandRepositoryImp(mockRemoteDataSource, mockNetworkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  // ignore: unused_element
  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getCarBrands', () {
    final String endpoint = 'carros';
    final carBrandModel = CarBrandModel(
        id: 1, key: '123', name: 'carBrand', fipeName: 'carBrandFip');
    final List<CarBrandModel> tcarBrandModel = [carBrandModel];

    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.findBrands(endpoint);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCarBrand(any))
              .thenAnswer((_) async => tcarBrandModel);
          // act
          final result = await repository.findBrands(endpoint);
          // assert
          verify(mockRemoteDataSource.getCarBrand(endpoint));
          expect(result, equals(Right(tcarBrandModel)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCarBrand(any))
              .thenThrow(ServerException());
          // act
          final result = await repository.findBrands(endpoint);
          // assert
          verify(mockRemoteDataSource.getCarBrand(endpoint));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/usecases/get_car_brand.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/bloc.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/car_brand_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetCarBrand extends Mock implements GetCarBrand {}

void main() {
  CarBrandBloc bloc;
  MockGetCarBrand mockGetCarBrand;

  setUp(() {
    mockGetCarBrand = MockGetCarBrand();

    bloc = CarBrandBloc(mockGetCarBrand);
  });

  test('initialState should be Empty', () {
    // assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('getListCarBrands', () {
    final String endpoint = "carros";

    test(
      'should get data from the concrete use case',
      () async {
        // arrange
        when(mockGetCarBrand(any))
            .thenAnswer((_) async => Right(List<CarBrand>()));
        // act
        bloc.add(GetCarBrandEvent(endpoint));
        await untilCalled(mockGetCarBrand(any));
        // assert
        verify(mockGetCarBrand(Params(type: endpoint)));
      },
    );

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetCarBrand(any))
            .thenAnswer((_) async => Right(List<CarBrand>()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(listCarBrand: List<CarBrand>()),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetCarBrandEvent(endpoint));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        when(mockGetCarBrand(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetCarBrandEvent(endpoint));
      },
    );
  });
}

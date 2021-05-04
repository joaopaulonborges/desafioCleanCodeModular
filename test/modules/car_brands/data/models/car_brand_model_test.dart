import 'dart:convert';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/models/car_brand_model.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../core/util/fixture_reader.dart';

void main() {
  final carBrandModel = CarBrandModel(
      id: 1, key: '123', name: 'carBrand', fipeName: 'carBrandFip');

  test(
    'should be a subclass of CarBrand entity',
    () async {
      // assert
      expect(carBrandModel, isA<CarBrand>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('car_brand.json'));
        // act
        final result = CarBrandModel.fromJson(jsonMap);
        // assert
        expect(result, isA<CarBrandModel>());
      },
    );
  });

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = carBrandModel.toJson(carBrandModel);
        // assert
        final expectedMap = {
          "id": 1,
          "key": "123",
          "name": "carBrand",
          "fipeName": "carBrandFip"
        };
        expect(result, expectedMap);
      },
    );
  });
}

import 'package:desafio_modular_clean_code/app/modules/car_brands/data/datasources/car_brand_remote_datasource.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/models/car_brand_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import '../../../../core/util/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  CarBrandRemoteDataSourceImp dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CarBrandRemoteDataSourceImp();
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('car_brand.json'), 200));
  }

  group('getCarBrands', () {
    final String endpoint = 'carros';

    test(
      'should return List<CarBrand> when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getCarBrand(endpoint);
        // assert
        expect(result, isA<List<CarBrandModel>>());
      },
    );
  });
}

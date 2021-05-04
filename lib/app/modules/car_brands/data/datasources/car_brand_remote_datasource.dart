import 'package:desafio_modular_clean_code/app/core/error/exceptions.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/data/models/car_brand_model.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class CarBrandRemoteDataSource {
  Future<List<CarBrand>> getCarBrand(String type);
}

class CarBrandRemoteDataSourceImp implements CarBrandRemoteDataSource {
  @override
  Future<List<CarBrand>> getCarBrand(String type) async =>
      await _getCarBrandsFromUrl(
          'https://fipeapi.appspot.com/api/1/$type/marcas.json');

  Future<List<CarBrand>> _getCarBrandsFromUrl(String url) async {
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((data) => CarBrandModel.fromJson(data))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (erro) {
      throw ServerException();
    }
  }
}

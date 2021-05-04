import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';

class CarBrandModel extends CarBrand {
  CarBrandModel({
    int id,
    String key,
    String name,
    String fipeName,
  }) : super(id: id, key: key, name: name, fipeName: fipeName);

  factory CarBrandModel.fromJson(Map<String, dynamic> json) {
    return CarBrandModel(
      id: json['id'],
      key: json['key'],
      name: json['name'],
      fipeName: json['fipe_name'],
    );
  }

  Map<String, dynamic> toJson(CarBrandModel carBrandModel) {
    return {
      'id': id,
      'key': key,
      'name': name,
      'fipeName': fipeName,
    };
  }
}

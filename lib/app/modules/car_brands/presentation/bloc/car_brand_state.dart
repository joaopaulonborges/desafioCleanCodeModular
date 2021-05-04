import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CarBrandState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends CarBrandState {}

class Loading extends CarBrandState {}

class Loaded extends CarBrandState {
  final List<CarBrand> listCarBrand;

  Loaded({@required this.listCarBrand});

  @override
  List<Object> get props => [listCarBrand];
}

class Error extends CarBrandState {
  final String message;

  Error({@required this.message});

  @override
  List<Object> get props => [message];
}

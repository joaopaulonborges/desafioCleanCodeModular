import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CarBrandEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCarBrandEvent extends CarBrandEvent {
  final String type;

  GetCarBrandEvent(this.type);

  @override
  List<Object> get props => [type];
}

import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/entities/car_brand_entite.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/domain/usecases/get_car_brand.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/car_brand_event.dart';
import 'package:desafio_modular_clean_code/app/modules/car_brands/presentation/bloc/car_brand_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

const String SERVER_FAILURE_MESSAGE = 'server failure';
const String NETWORK_FAILURE_MESSAGE = 'network failure';

class CarBrandBloc extends Bloc<CarBrandEvent, CarBrandState> {
  final GetCarBrand getCarBrand;

  CarBrandBloc(
    this.getCarBrand,
  );

  @override
  CarBrandState get initialState => Empty();

  @override
  Stream<CarBrandState> mapEventToState(CarBrandEvent event) async* {
    if (event is GetCarBrandEvent) {
      yield Loading();
      final failureOrCarBrand = await getCarBrand(Params(type: event.type));
      yield* _heiterLoadedOrErrorState(failureOrCarBrand);
    }
  }

  Stream<CarBrandState> _heiterLoadedOrErrorState(
      Either<Failure, List<CarBrand>> failureOrCarBrand) async* {
    yield failureOrCarBrand.fold(
      (failure) => Error(message: _mapFailureToMessage(failure)),
      (trivia) => Loaded(listCarBrand: trivia),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case NetworkFailure:
        return NETWORK_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

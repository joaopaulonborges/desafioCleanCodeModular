import 'package:dartz/dartz.dart';
import 'package:desafio_modular_clean_code/app/core/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

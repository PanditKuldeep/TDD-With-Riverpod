import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/core/usecases/usecase.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';

class GetConcreteNumberCheckerUseCase
    implements UseCase<NumberCheckerEntity, Params> {
  final NumberCheckerRepository repository;

  GetConcreteNumberCheckerUseCase(this.repository);

  @override
  Future<Either<Failure, NumberCheckerEntity>> call(Params params) async {
    return await repository.getConcreteNumberChecker(params.number);
  }
}

class Params extends Equatable {
  final int number;

  const Params({required this.number});

  @override
  List<Object> get props => [number];
}

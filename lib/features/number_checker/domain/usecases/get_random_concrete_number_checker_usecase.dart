import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/core/usecases/usecase.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';

class GetRandomConcreteNumberCheckerUseCase
    implements UseCase<NumberCheckerEntity, NoParams> {
  final NumberCheckerRepository repository;

  GetRandomConcreteNumberCheckerUseCase(this.repository);

  @override
  Future<Either<Failure, NumberCheckerEntity>> call(NoParams params) async {
    return await repository.getRandomNumberChecker();
  }
}

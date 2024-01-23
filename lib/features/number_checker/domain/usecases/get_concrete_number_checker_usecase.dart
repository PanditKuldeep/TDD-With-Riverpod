import 'package:dartz/dartz.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';

class GetConcreteNumberCheckerUseCase {
  final NumberCheckerRepository repository;

  GetConcreteNumberCheckerUseCase(this.repository);

  Future<Either<Failure, NumberCheckerEntity>> execute({required int number}) async {
    return await repository.getConcreteNumberChecker(number);
  }

}

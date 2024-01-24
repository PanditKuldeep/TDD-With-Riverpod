import 'package:dartz/dartz.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';


abstract class NumberCheckerRepository {
  Future<Either<Failure, NumberCheckerEntity>> getConcreteNumberChecker(
      int number);

  Future<Either<Failure, NumberCheckerEntity>> getRandomNumberChecker();
}

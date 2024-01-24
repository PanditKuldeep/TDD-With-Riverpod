import 'package:dartz/dartz.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';

class NumberCheckerRepositoryImpl implements NumberCheckerRepository {
  
  @override
  Future<Either<Failure, NumberCheckerEntity>> getConcreteNumberChecker(int number) {
    // TODO: implement getConcreteNumberChecker
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberCheckerEntity>> getRandomNumberChecker() {
    // TODO: implement getRandomNumberChecker
    throw UnimplementedError();
  }
}

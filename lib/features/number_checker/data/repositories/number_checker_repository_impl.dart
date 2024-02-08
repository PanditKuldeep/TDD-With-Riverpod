import 'package:dartz/dartz.dart';
import 'package:tdd_with_riverpod/core/error/exception.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/core/network/network_info.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_local_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_remote_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';

typedef  _ConcreteOrRandomChooser = Future<NumberCheckerModel> Function();

class NumberCheckerRepositoryImpl implements NumberCheckerRepository {
  final NumberCheckerRemoteDataSource remoteDataSource;
  final NumberCheckerLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberCheckerRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, NumberCheckerEntity>> getConcreteNumberChecker(
      int number) async {
    return await _getNumber(() {
      return remoteDataSource.getConcreteNumberChecker(number);
    });
  }

  @override
  Future<Either<Failure, NumberCheckerEntity>> getRandomNumberChecker() async {
    return await _getNumber(() {
      return remoteDataSource.getRandomNumberChecker();
    });
  }

  Future<Either<Failure, NumberCheckerEntity>> _getNumber(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteResponse = await getConcreteOrRandom();
        localDataSource.cacheNumber(remoteResponse);
        return Right(remoteResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localResponse = await localDataSource.getLastNumber();
        return Right(localResponse);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_with_riverpod/core/error/exception.dart';
import 'package:tdd_with_riverpod/core/error/failures.dart';
import 'package:tdd_with_riverpod/core/network/network_info.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_local_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_remote_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/repositories/number_checker_repository_impl.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';

import 'number_checker_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NumberCheckerRemoteDataSource>(),
  MockSpec<NumberCheckerLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  late NumberCheckerRepositoryImpl repository;
  late MockNumberCheckerRemoteDataSource remoteDataSource;
  late MockNumberCheckerLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    remoteDataSource = MockNumberCheckerRemoteDataSource();
    localDataSource = MockNumberCheckerLocalDataSource();
    networkInfo = MockNetworkInfo();
    repository = NumberCheckerRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo);
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() => when(networkInfo.isConnected).thenAnswer((_) async => true));
      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() => when(networkInfo.isConnected).thenAnswer((_) async => false));
      body();
    });
  }

  group('getConcreteNumberChecker', () {
    const tNumber = 1;
    const tNumberCheckerModel =
        NumberCheckerModel(text: 'test', number: tNumber);
    const NumberCheckerEntity tNumberChecker = tNumberCheckerModel;

    test('should check if device is online', () async {
      /// arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);

      /// act
      repository.getConcreteNumberChecker(tNumber);

      /// assert
      verify(networkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getConcreteNumberChecker(any))
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        final result = await repository.getConcreteNumberChecker(tNumber);

        /// assert
        verify(remoteDataSource.getConcreteNumberChecker(tNumber));
        expect(result, equals(const Right(tNumberChecker)));
      });

      test(
          'should cache the data locally when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getConcreteNumberChecker(any))
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        await repository.getConcreteNumberChecker(tNumber);

        /// assert
        verify(remoteDataSource.getConcreteNumberChecker(tNumber));
        verify(localDataSource.cacheNumber(tNumberCheckerModel));
      });

      test(
          'should return server failure when the call to remote data source is unSuccess',
          () async {
        /// arrange
        when(remoteDataSource.getConcreteNumberChecker(any))
            .thenThrow(ServerException());

        /// act
        final result = await repository.getConcreteNumberChecker(tNumber);

        /// assert
        verify(remoteDataSource.getConcreteNumberChecker(tNumber));
        verifyZeroInteractions(localDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
          'should return locally cached data when the cached data is available',
          () async {
        /// arrange
        when(localDataSource.getLastNumber())
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        final result = await repository.getConcreteNumberChecker(tNumber);

        /// assert
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getLastNumber());
        expect(result, equals(const Right(tNumberChecker)));
      });

      test('should return cached failure when there is no cached data present',
          () async {
        /// arrange
        when(localDataSource.getLastNumber()).thenThrow(CacheException());

        /// act
        final result = await repository.getConcreteNumberChecker(tNumber);

        /// assert
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getLastNumber());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

  group('getRandomNumberChecker', () {
    const tNumberCheckerModel = NumberCheckerModel(text: 'test', number: 14);
    const NumberCheckerEntity tNumberChecker = tNumberCheckerModel;

    test('should check if device is online', () async {
      /// arrange
      when(networkInfo.isConnected).thenAnswer((_) async => true);

      /// act
      repository.getRandomNumberChecker();

      /// assert
      verify(networkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getRandomNumberChecker())
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        final result = await repository.getRandomNumberChecker();

        /// assert
        verify(remoteDataSource.getRandomNumberChecker());
        expect(result, equals(const Right(tNumberChecker)));
      });

      test(
          'should cache the data locally when the call to remote data source is success',
          () async {
        /// arrange
        when(remoteDataSource.getRandomNumberChecker())
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        await repository.getRandomNumberChecker();

        /// assert
        verify(remoteDataSource.getRandomNumberChecker());
        verify(localDataSource.cacheNumber(tNumberCheckerModel));
      });

      test(
          'should return server failure when the call to remote data source is unSuccess',
          () async {
        /// arrange
        when(remoteDataSource.getRandomNumberChecker())
            .thenThrow(ServerException());

        /// act
        final result = await repository.getRandomNumberChecker();

        /// assert
        verify(remoteDataSource.getRandomNumberChecker());
        verifyZeroInteractions(localDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    runTestsOffline(() {
      test(
          'should return locally cached data when the cached data is available',
          () async {
        /// arrange
        when(localDataSource.getLastNumber())
            .thenAnswer((_) async => tNumberCheckerModel);

        /// act
        final result = await repository.getRandomNumberChecker();

        /// assert
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getLastNumber());
        expect(result, equals(const Right(tNumberChecker)));
      });

      test('should return cached failure when there is no cached data present',
          () async {
        /// arrange
        when(localDataSource.getLastNumber()).thenThrow(CacheException());

        /// act
        final result = await repository.getRandomNumberChecker();

        /// assert
        verifyZeroInteractions(remoteDataSource);
        verify(localDataSource.getLastNumber());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}

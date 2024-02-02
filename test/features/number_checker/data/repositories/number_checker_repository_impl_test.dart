import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_with_riverpod/core/platform/network_info.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_local_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_remote_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/repositories/number_checker_repository_impl.dart';

import 'number_checker_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<NumberCheckerRemoteDataSource>(),
  MockSpec<NumberCheckerLocalDataSource>(),
  MockSpec<NetworkInfo>()
])
void main() {
  late NumberCheckerRepositoryImpl repositoryImpl;
  late MockNumberCheckerRemoteDataSource remoteDataSource;
  late MockNumberCheckerLocalDataSource localDataSource;
  late MockNetworkInfo networkInfo;

  setUp(() {
    remoteDataSource = MockNumberCheckerRemoteDataSource();
    localDataSource = MockNumberCheckerLocalDataSource();
    networkInfo = MockNetworkInfo();
    repositoryImpl = NumberCheckerRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo);
  });
}

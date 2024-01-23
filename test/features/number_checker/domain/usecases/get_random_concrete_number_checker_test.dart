import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_with_riverpod/core/usecases/usecase.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/usecases/get_concrete_number_checker_usecase.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/usecases/get_random_concrete_number_checker_usecase.dart';
import 'get_concrete_number_checker_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberCheckerRepository>()])
void main() {
  late GetRandomConcreteNumberCheckerUseCase useCase;
  late MockNumberCheckerRepository mockNumberCheckerRepository;

  setUp(() {
    mockNumberCheckerRepository = MockNumberCheckerRepository();
    useCase =
        GetRandomConcreteNumberCheckerUseCase(mockNumberCheckerRepository);
  });

  const tNumberResponse = NumberCheckerEntity(text: 'test', number: 1);

  test('get random concrete number from the repository ', () async {
    /// arrange
    when(mockNumberCheckerRepository.getRandomNumberChecker())
        .thenAnswer((_) async => const Right(tNumberResponse));

    /// act
    final result = await useCase(NoParams());

    /// assert
    expect(result, const Right(tNumberResponse));
    verify(mockNumberCheckerRepository.getRandomNumberChecker()).called(1);
    verifyNoMoreInteractions(mockNumberCheckerRepository);
  });
}

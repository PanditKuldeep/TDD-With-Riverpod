import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/usecases/get_concrete_number_checker_usecase.dart';
import 'get_concrete_number_checker_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberCheckerRepository>()])
void main() {
  late GetConcreteNumberCheckerUseCase useCase;
  late MockNumberCheckerRepository mockNumberCheckerRepository;

  setUp(() {
    mockNumberCheckerRepository = MockNumberCheckerRepository();
    useCase = GetConcreteNumberCheckerUseCase(mockNumberCheckerRepository);
  });

  const tNumber = 1;
  const tNumberCheckerEntity = NumberCheckerEntity(text: 'test', number: tNumber);

  test('get concrete number from the repository ', () async {
    /// arrange
    when(mockNumberCheckerRepository.getConcreteNumberChecker(tNumber))
        .thenAnswer((_) async => const Right(tNumberCheckerEntity));

    /// act
    final result = await useCase(const Params(number: tNumber));

    /// assert
    expect(result, const Right(tNumberCheckerEntity));
    verify(mockNumberCheckerRepository.getConcreteNumberChecker(tNumber))
        .called(1);
    verifyNoMoreInteractions(mockNumberCheckerRepository);
  });
}

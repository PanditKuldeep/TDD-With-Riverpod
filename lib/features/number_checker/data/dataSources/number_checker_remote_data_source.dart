import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';

abstract class NumberCheckerRemoteDataSource {

  Future<NumberCheckerModel> getConcreteNumberChecker(int number);

  Future<NumberCheckerModel> getRandomNumberChecker();
}

import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';

abstract class NumberCheckerLocalDataSource {
  
  Future<NumberCheckerModel> getLastNumber();

  Future<void> cacheNumber(NumberCheckerModel cacheModel);
}

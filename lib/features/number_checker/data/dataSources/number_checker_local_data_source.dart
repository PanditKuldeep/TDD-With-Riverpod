import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_with_riverpod/core/error/exception.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';

abstract class NumberCheckerLocalDataSource {
  Future<NumberCheckerModel> getLastNumber();

  cacheNumber(NumberCheckerModel cacheModel);
}

const String cachedNumber = 'CACHED_NUMBER';

class NumberCheckerLocalDataSourceImpl implements NumberCheckerLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberCheckerLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<NumberCheckerModel> getLastNumber() {
    final jsonString = sharedPreferences.getString(cachedNumber);
    return jsonString != null
        ? Future.value(NumberCheckerModel.fromJson(json.decode(jsonString)))
        : throw CacheException();
  }

  @override
  cacheNumber(NumberCheckerModel cacheModel) {
    sharedPreferences.setString(
      cachedNumber,
      json.encode(cacheModel.toJson()),
    );
  }
}

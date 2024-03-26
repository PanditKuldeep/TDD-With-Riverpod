import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdd_with_riverpod/core/error/exception.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_local_data_source.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import 'number_checker_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
void main() {
  late MockSharedPreferences sharedPreferences;
  late NumberCheckerLocalDataSourceImpl numberCheckerLocalDataSource;

  setUp(() {
    sharedPreferences = MockSharedPreferences();
    numberCheckerLocalDataSource =
        NumberCheckerLocalDataSourceImpl(sharedPreferences: sharedPreferences);
  });

  group('getLastNumber', () {
    test('should return number from SharedPreferences when there is one',
        () async {
      final tNumberModel = NumberCheckerModel.fromJson(
          json.decode(fixture('number_checker.json')));

      /// arrange
      when(sharedPreferences.getString(any))
          .thenReturn(fixture('number_checker.json'));

      /// act
      final result = await numberCheckerLocalDataSource.getLastNumber();

      /// assert
      verify(sharedPreferences.getString(cachedNumber));
      expect(result, equals(tNumberModel));
    });

    test('should throw a cacheException when there is not a cached value',
        () async {
      /// arrange
      when(sharedPreferences.getString(any)).thenReturn(null);

      /// act
      final call = numberCheckerLocalDataSource.getLastNumber;

      /// assert

      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group('cacheNumber', () {
    const tNumberCheckerModel = NumberCheckerModel(text: 'test', number: 1);

    test('should call SharedPreferences to store the data', () async {
      /// act
      numberCheckerLocalDataSource.cacheNumber(tNumberCheckerModel);

      /// assert
      final expectedString = json.encode(tNumberCheckerModel.toJson());
      verify(sharedPreferences.setString(cachedNumber, expectedString));
    });
  });
}

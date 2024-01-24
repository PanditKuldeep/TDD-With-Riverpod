import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart';
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tNumberCheckerModel = NumberCheckerModel(text: 'Test Text', number: 1);

  test('should be a subclass of NumberCheckerEntity', () {
    // assert
    expect(tNumberCheckerModel, isA<NumberCheckerEntity>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('number_checker.json'));
      // act
      final result = NumberCheckerModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberCheckerModel);
    });

    test('should return a valid model when the JSON number is an double',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('number_checker_double_value.json'));
      // act
      final result = NumberCheckerModel.fromJson(jsonMap);
      // assert
      expect(result, tNumberCheckerModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final expectedMap = {
        "text": "Test Text",
        "number": 1,
      };
      // act
      final result = tNumberCheckerModel.toJson();
      // assert
      expect(result, expectedMap);
    });
  });
}

import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart';

class NumberCheckerModel extends NumberCheckerEntity {
  const NumberCheckerModel({required String text, required int number})
      : super(text: text, number: number);

  factory NumberCheckerModel.fromJson(Map<String, dynamic> json) {
    return NumberCheckerModel(
        text: json['text'], number: (json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}

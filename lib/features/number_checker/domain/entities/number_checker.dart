import 'package:equatable/equatable.dart';

class NumberCheckerEntity extends Equatable {
  final String text;
  final int number;

  const NumberCheckerEntity({required this.text, required this.number});

  @override
  List<Object?> get props => [text, number];

  factory NumberCheckerEntity.fromJson(Map<String, dynamic> json) {
    return NumberCheckerEntity(text: json['text'], number: json['number']);
  }

}

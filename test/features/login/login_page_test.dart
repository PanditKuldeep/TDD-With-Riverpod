import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_riverpod/core/validations.dart';

void main() {
  late Validator validator;

  setUp(() => validator = Validator());

  test('email cannot be null or empty',(){
    bool caseOne = validator.validateEmail(value: null);
    bool caseTwo = validator.validateEmail(value: '');
    expect(caseOne, false);
    expect(caseTwo, false);
  });

  test('email format check',(){
    bool caseOne = validator.validateEmail(value: 'kpm');
    expect(caseOne, false);
  });

  test('password cannot be null or empty', () {
    bool caseOne = validator.validatePassword(value: null);
    bool caseTwo = validator.validatePassword(value: '');
    expect(caseOne, false);
    expect(caseTwo, false);
  });
  
  test('password length cannot be smaller than 6', () {
   bool caseOne = validator.validatePassword(value:'1234');
   expect(caseOne,false);
  });

  test('password needs to contain at least 1 capital',(){
    bool caseOne = validator.validatePassword(value:'abcfc');
    expect(caseOne, false);
  });

  group('login button validation', () {
    test('email format check',(){
      bool emailValidation = validator.validateEmail(value: 'kp123');
      expect(emailValidation, false);
    });

    test('password format check',(){
      bool passwordValidation = validator.validatePassword(value:'abcfc');
      expect(passwordValidation, false);
    });
  });

}

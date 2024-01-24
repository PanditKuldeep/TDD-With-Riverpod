// Mocks generated by Mockito 5.4.4 from annotations
// in tdd_with_riverpod/test/features/number_checker/domain/usecases/get_concrete_number_checker_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tdd_with_riverpod/core/error/failures.dart' as _i5;
import 'package:tdd_with_riverpod/features/number_checker/domain/entities/number_checker_entity.dart'
    as _i6;
import 'package:tdd_with_riverpod/features/number_checker/domain/repositories/number_checker_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NumberCheckerRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberCheckerRepository extends _i1.Mock
    implements _i3.NumberCheckerRepository {
  @override
  _i4.Future<
      _i2
      .Either<_i5.Failure, _i6.NumberCheckerEntity>> getConcreteNumberChecker(
          int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConcreteNumberChecker,
          [number],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberCheckerEntity>(
          this,
          Invocation.method(
            #getConcreteNumberChecker,
            [number],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberCheckerEntity>(
          this,
          Invocation.method(
            #getConcreteNumberChecker,
            [number],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure,
          _i6.NumberCheckerEntity>> getRandomNumberChecker() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomNumberChecker,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberCheckerEntity>(
          this,
          Invocation.method(
            #getRandomNumberChecker,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>.value(
                _FakeEither_0<_i5.Failure, _i6.NumberCheckerEntity>(
          this,
          Invocation.method(
            #getRandomNumberChecker,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.NumberCheckerEntity>>);
}

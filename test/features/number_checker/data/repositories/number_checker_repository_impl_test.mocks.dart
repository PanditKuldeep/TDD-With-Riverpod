// Mocks generated by Mockito 5.4.4 from annotations
// in tdd_with_riverpod/test/features/number_checker/data/repositories/number_checker_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tdd_with_riverpod/core/network/network_info.dart' as _i6;
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_local_data_source.dart'
    as _i5;
import 'package:tdd_with_riverpod/features/number_checker/data/dataSources/number_checker_remote_data_source.dart'
    as _i3;
import 'package:tdd_with_riverpod/features/number_checker/data/models/number_checker_model.dart'
    as _i2;

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

class _FakeNumberCheckerModel_0 extends _i1.SmartFake
    implements _i2.NumberCheckerModel {
  _FakeNumberCheckerModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NumberCheckerRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberCheckerRemoteDataSource extends _i1.Mock
    implements _i3.NumberCheckerRemoteDataSource {
  @override
  _i4.Future<_i2.NumberCheckerModel> getConcreteNumberChecker(int? number) =>
      (super.noSuchMethod(
        Invocation.method(
          #getConcreteNumberChecker,
          [number],
        ),
        returnValue:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getConcreteNumberChecker,
            [number],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getConcreteNumberChecker,
            [number],
          ),
        )),
      ) as _i4.Future<_i2.NumberCheckerModel>);

  @override
  _i4.Future<_i2.NumberCheckerModel> getRandomNumberChecker() =>
      (super.noSuchMethod(
        Invocation.method(
          #getRandomNumberChecker,
          [],
        ),
        returnValue:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getRandomNumberChecker,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getRandomNumberChecker,
            [],
          ),
        )),
      ) as _i4.Future<_i2.NumberCheckerModel>);
}

/// A class which mocks [NumberCheckerLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockNumberCheckerLocalDataSource extends _i1.Mock
    implements _i5.NumberCheckerLocalDataSource {
  @override
  _i4.Future<_i2.NumberCheckerModel> getLastNumber() => (super.noSuchMethod(
        Invocation.method(
          #getLastNumber,
          [],
        ),
        returnValue:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getLastNumber,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.NumberCheckerModel>.value(_FakeNumberCheckerModel_0(
          this,
          Invocation.method(
            #getLastNumber,
            [],
          ),
        )),
      ) as _i4.Future<_i2.NumberCheckerModel>);

  @override
  _i4.Future<void> cacheNumber(_i2.NumberCheckerModel? cacheModel) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheNumber,
          [cacheModel],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i6.NetworkInfo {
  @override
  _i4.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i4.Future<bool>.value(false),
        returnValueForMissingStub: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
}

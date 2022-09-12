import 'package:core/extensions/either_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('rightOrNull', () {
    test('isRight return right value', () {
      final either = right(1);
      final result = either.rightOrNull();
      expect(result, 1);
    });
    test('isLeft return null', () {
      final either = left(1);
      final result = either.rightOrNull();
      expect(result, null);
    });
  });

  group('leftOrNull', () {
    test('isLeft return right value', () {
      final either = left(1);
      final result = either.leftOrNull();
      expect(result, 1);
    });
    test('isRight return null', () {
      final either = right(1);
      final result = either.leftOrNull();
      expect(result, null);
    });
  });
}

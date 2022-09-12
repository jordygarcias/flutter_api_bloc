import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  R? rightOrNull() => isRight() ? (this as Right<L, R>).value : null;
  L? leftOrNull() => isLeft() ? (this as Left<L, R>).value : null;
}

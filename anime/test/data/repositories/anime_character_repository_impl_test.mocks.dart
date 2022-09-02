// Mocks generated by Mockito 5.3.0 from annotations
// in anime/test/data/repositories/anime_character_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:anime/data/datasources/remote/anime_character_remote_data_source.dart'
    as _i4;
import 'package:anime/data/models/anime_character_model.dart' as _i7;
import 'package:core/failures/failures.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [AnimeCharacterRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeCharacterRemoteDataSource extends _i1.Mock
    implements _i4.AnimeCharacterRemoteDataSource {
  MockAnimeCharacterRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get client => (super.noSuchMethod(Invocation.getter(#client),
      returnValue: _FakeDio_0(this, Invocation.getter(#client))) as _i2.Dio);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.AnimeCharacterModel>>>
      getCharactersForAnime({int? animeId}) => (super.noSuchMethod(
              Invocation.method(#getCharactersForAnime, [], {#animeId: animeId}),
              returnValue:
                  _i5.Future<_i3.Either<_i6.Failure, List<_i7.AnimeCharacterModel>>>.value(
                      _FakeEither_1<_i6.Failure, List<_i7.AnimeCharacterModel>>(
                          this,
                          Invocation.method(#getCharactersForAnime, [], {#animeId: animeId}))))
          as _i5.Future<_i3.Either<_i6.Failure, List<_i7.AnimeCharacterModel>>>);
}

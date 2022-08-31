// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'anime_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimeState {
  List<GenreEntity> get genres => throw _privateConstructorUsedError;
  List<AnimeEntity> get animes => throw _privateConstructorUsedError;
  bool get isLoadingGenres => throw _privateConstructorUsedError;
  bool get isLoadingTopAnimes => throw _privateConstructorUsedError;
  Failure? get genreListFailure => throw _privateConstructorUsedError;
  Failure? get animeListFailure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeStateCopyWith<AnimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeStateCopyWith<$Res> {
  factory $AnimeStateCopyWith(
          AnimeState value, $Res Function(AnimeState) then) =
      _$AnimeStateCopyWithImpl<$Res>;
  $Res call(
      {List<GenreEntity> genres,
      List<AnimeEntity> animes,
      bool isLoadingGenres,
      bool isLoadingTopAnimes,
      Failure? genreListFailure,
      Failure? animeListFailure});
}

/// @nodoc
class _$AnimeStateCopyWithImpl<$Res> implements $AnimeStateCopyWith<$Res> {
  _$AnimeStateCopyWithImpl(this._value, this._then);

  final AnimeState _value;
  // ignore: unused_field
  final $Res Function(AnimeState) _then;

  @override
  $Res call({
    Object? genres = freezed,
    Object? animes = freezed,
    Object? isLoadingGenres = freezed,
    Object? isLoadingTopAnimes = freezed,
    Object? genreListFailure = freezed,
    Object? animeListFailure = freezed,
  }) {
    return _then(_value.copyWith(
      genres: genres == freezed
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreEntity>,
      animes: animes == freezed
          ? _value.animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<AnimeEntity>,
      isLoadingGenres: isLoadingGenres == freezed
          ? _value.isLoadingGenres
          : isLoadingGenres // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTopAnimes: isLoadingTopAnimes == freezed
          ? _value.isLoadingTopAnimes
          : isLoadingTopAnimes // ignore: cast_nullable_to_non_nullable
              as bool,
      genreListFailure: genreListFailure == freezed
          ? _value.genreListFailure
          : genreListFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      animeListFailure: animeListFailure == freezed
          ? _value.animeListFailure
          : animeListFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnimeStateCopyWith<$Res>
    implements $AnimeStateCopyWith<$Res> {
  factory _$$_AnimeStateCopyWith(
          _$_AnimeState value, $Res Function(_$_AnimeState) then) =
      __$$_AnimeStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<GenreEntity> genres,
      List<AnimeEntity> animes,
      bool isLoadingGenres,
      bool isLoadingTopAnimes,
      Failure? genreListFailure,
      Failure? animeListFailure});
}

/// @nodoc
class __$$_AnimeStateCopyWithImpl<$Res> extends _$AnimeStateCopyWithImpl<$Res>
    implements _$$_AnimeStateCopyWith<$Res> {
  __$$_AnimeStateCopyWithImpl(
      _$_AnimeState _value, $Res Function(_$_AnimeState) _then)
      : super(_value, (v) => _then(v as _$_AnimeState));

  @override
  _$_AnimeState get _value => super._value as _$_AnimeState;

  @override
  $Res call({
    Object? genres = freezed,
    Object? animes = freezed,
    Object? isLoadingGenres = freezed,
    Object? isLoadingTopAnimes = freezed,
    Object? genreListFailure = freezed,
    Object? animeListFailure = freezed,
  }) {
    return _then(_$_AnimeState(
      genres: genres == freezed
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<GenreEntity>,
      animes: animes == freezed
          ? _value._animes
          : animes // ignore: cast_nullable_to_non_nullable
              as List<AnimeEntity>,
      isLoadingGenres: isLoadingGenres == freezed
          ? _value.isLoadingGenres
          : isLoadingGenres // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingTopAnimes: isLoadingTopAnimes == freezed
          ? _value.isLoadingTopAnimes
          : isLoadingTopAnimes // ignore: cast_nullable_to_non_nullable
              as bool,
      genreListFailure: genreListFailure == freezed
          ? _value.genreListFailure
          : genreListFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      animeListFailure: animeListFailure == freezed
          ? _value.animeListFailure
          : animeListFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_AnimeState implements _AnimeState {
  _$_AnimeState(
      {required final List<GenreEntity> genres,
      required final List<AnimeEntity> animes,
      required this.isLoadingGenres,
      required this.isLoadingTopAnimes,
      this.genreListFailure,
      this.animeListFailure})
      : _genres = genres,
        _animes = animes;

  final List<GenreEntity> _genres;
  @override
  List<GenreEntity> get genres {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<AnimeEntity> _animes;
  @override
  List<AnimeEntity> get animes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_animes);
  }

  @override
  final bool isLoadingGenres;
  @override
  final bool isLoadingTopAnimes;
  @override
  final Failure? genreListFailure;
  @override
  final Failure? animeListFailure;

  @override
  String toString() {
    return 'AnimeState(genres: $genres, animes: $animes, isLoadingGenres: $isLoadingGenres, isLoadingTopAnimes: $isLoadingTopAnimes, genreListFailure: $genreListFailure, animeListFailure: $animeListFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeState &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._animes, _animes) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingGenres, isLoadingGenres) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingTopAnimes, isLoadingTopAnimes) &&
            const DeepCollectionEquality()
                .equals(other.genreListFailure, genreListFailure) &&
            const DeepCollectionEquality()
                .equals(other.animeListFailure, animeListFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_animes),
      const DeepCollectionEquality().hash(isLoadingGenres),
      const DeepCollectionEquality().hash(isLoadingTopAnimes),
      const DeepCollectionEquality().hash(genreListFailure),
      const DeepCollectionEquality().hash(animeListFailure));

  @JsonKey(ignore: true)
  @override
  _$$_AnimeStateCopyWith<_$_AnimeState> get copyWith =>
      __$$_AnimeStateCopyWithImpl<_$_AnimeState>(this, _$identity);
}

abstract class _AnimeState implements AnimeState {
  factory _AnimeState(
      {required final List<GenreEntity> genres,
      required final List<AnimeEntity> animes,
      required final bool isLoadingGenres,
      required final bool isLoadingTopAnimes,
      final Failure? genreListFailure,
      final Failure? animeListFailure}) = _$_AnimeState;

  @override
  List<GenreEntity> get genres;
  @override
  List<AnimeEntity> get animes;
  @override
  bool get isLoadingGenres;
  @override
  bool get isLoadingTopAnimes;
  @override
  Failure? get genreListFailure;
  @override
  Failure? get animeListFailure;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeStateCopyWith<_$_AnimeState> get copyWith =>
      throw _privateConstructorUsedError;
}

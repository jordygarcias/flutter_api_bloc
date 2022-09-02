// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'anime_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimeDetailsState {
  AnimeEntity? get anime => throw _privateConstructorUsedError;
  bool get isLoadingCharacters => throw _privateConstructorUsedError;
  List<AnimeCharacterEntity> get characters =>
      throw _privateConstructorUsedError;
  Failure? get charactersFailure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeDetailsStateCopyWith<AnimeDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeDetailsStateCopyWith<$Res> {
  factory $AnimeDetailsStateCopyWith(
          AnimeDetailsState value, $Res Function(AnimeDetailsState) then) =
      _$AnimeDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {AnimeEntity? anime,
      bool isLoadingCharacters,
      List<AnimeCharacterEntity> characters,
      Failure? charactersFailure});
}

/// @nodoc
class _$AnimeDetailsStateCopyWithImpl<$Res>
    implements $AnimeDetailsStateCopyWith<$Res> {
  _$AnimeDetailsStateCopyWithImpl(this._value, this._then);

  final AnimeDetailsState _value;
  // ignore: unused_field
  final $Res Function(AnimeDetailsState) _then;

  @override
  $Res call({
    Object? anime = freezed,
    Object? isLoadingCharacters = freezed,
    Object? characters = freezed,
    Object? charactersFailure = freezed,
  }) {
    return _then(_value.copyWith(
      anime: anime == freezed
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeEntity?,
      isLoadingCharacters: isLoadingCharacters == freezed
          ? _value.isLoadingCharacters
          : isLoadingCharacters // ignore: cast_nullable_to_non_nullable
              as bool,
      characters: characters == freezed
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<AnimeCharacterEntity>,
      charactersFailure: charactersFailure == freezed
          ? _value.charactersFailure
          : charactersFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc
abstract class _$$_AnimeDetailsStateCopyWith<$Res>
    implements $AnimeDetailsStateCopyWith<$Res> {
  factory _$$_AnimeDetailsStateCopyWith(_$_AnimeDetailsState value,
          $Res Function(_$_AnimeDetailsState) then) =
      __$$_AnimeDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AnimeEntity? anime,
      bool isLoadingCharacters,
      List<AnimeCharacterEntity> characters,
      Failure? charactersFailure});
}

/// @nodoc
class __$$_AnimeDetailsStateCopyWithImpl<$Res>
    extends _$AnimeDetailsStateCopyWithImpl<$Res>
    implements _$$_AnimeDetailsStateCopyWith<$Res> {
  __$$_AnimeDetailsStateCopyWithImpl(
      _$_AnimeDetailsState _value, $Res Function(_$_AnimeDetailsState) _then)
      : super(_value, (v) => _then(v as _$_AnimeDetailsState));

  @override
  _$_AnimeDetailsState get _value => super._value as _$_AnimeDetailsState;

  @override
  $Res call({
    Object? anime = freezed,
    Object? isLoadingCharacters = freezed,
    Object? characters = freezed,
    Object? charactersFailure = freezed,
  }) {
    return _then(_$_AnimeDetailsState(
      anime: anime == freezed
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as AnimeEntity?,
      isLoadingCharacters: isLoadingCharacters == freezed
          ? _value.isLoadingCharacters
          : isLoadingCharacters // ignore: cast_nullable_to_non_nullable
              as bool,
      characters: characters == freezed
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<AnimeCharacterEntity>,
      charactersFailure: charactersFailure == freezed
          ? _value.charactersFailure
          : charactersFailure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$_AnimeDetailsState implements _AnimeDetailsState {
  _$_AnimeDetailsState(
      {this.anime,
      required this.isLoadingCharacters,
      required final List<AnimeCharacterEntity> characters,
      this.charactersFailure})
      : _characters = characters;

  @override
  final AnimeEntity? anime;
  @override
  final bool isLoadingCharacters;
  final List<AnimeCharacterEntity> _characters;
  @override
  List<AnimeCharacterEntity> get characters {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  final Failure? charactersFailure;

  @override
  String toString() {
    return 'AnimeDetailsState(anime: $anime, isLoadingCharacters: $isLoadingCharacters, characters: $characters, charactersFailure: $charactersFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeDetailsState &&
            const DeepCollectionEquality().equals(other.anime, anime) &&
            const DeepCollectionEquality()
                .equals(other.isLoadingCharacters, isLoadingCharacters) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            const DeepCollectionEquality()
                .equals(other.charactersFailure, charactersFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(anime),
      const DeepCollectionEquality().hash(isLoadingCharacters),
      const DeepCollectionEquality().hash(_characters),
      const DeepCollectionEquality().hash(charactersFailure));

  @JsonKey(ignore: true)
  @override
  _$$_AnimeDetailsStateCopyWith<_$_AnimeDetailsState> get copyWith =>
      __$$_AnimeDetailsStateCopyWithImpl<_$_AnimeDetailsState>(
          this, _$identity);
}

abstract class _AnimeDetailsState implements AnimeDetailsState {
  factory _AnimeDetailsState(
      {final AnimeEntity? anime,
      required final bool isLoadingCharacters,
      required final List<AnimeCharacterEntity> characters,
      final Failure? charactersFailure}) = _$_AnimeDetailsState;

  @override
  AnimeEntity? get anime;
  @override
  bool get isLoadingCharacters;
  @override
  List<AnimeCharacterEntity> get characters;
  @override
  Failure? get charactersFailure;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeDetailsStateCopyWith<_$_AnimeDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

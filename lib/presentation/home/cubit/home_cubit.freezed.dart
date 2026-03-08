// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<Pokemon> get pokemon; bool get isLoading; String? get error; int get totalCount; bool get hasNext; Set<int> get favoriteIds; bool get showOnlyFavorites; String get searchQuery;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.pokemon, pokemon)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other.favoriteIds, favoriteIds)&&(identical(other.showOnlyFavorites, showOnlyFavorites) || other.showOnlyFavorites == showOnlyFavorites)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pokemon),isLoading,error,totalCount,hasNext,const DeepCollectionEquality().hash(favoriteIds),showOnlyFavorites,searchQuery);

@override
String toString() {
  return 'HomeState(pokemon: $pokemon, isLoading: $isLoading, error: $error, totalCount: $totalCount, hasNext: $hasNext, favoriteIds: $favoriteIds, showOnlyFavorites: $showOnlyFavorites, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<Pokemon> pokemon, bool isLoading, String? error, int totalCount, bool hasNext, Set<int> favoriteIds, bool showOnlyFavorites, String searchQuery
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemon = null,Object? isLoading = null,Object? error = freezed,Object? totalCount = null,Object? hasNext = null,Object? favoriteIds = null,Object? showOnlyFavorites = null,Object? searchQuery = null,}) {
  return _then(_self.copyWith(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,favoriteIds: null == favoriteIds ? _self.favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<int>,showOnlyFavorites: null == showOnlyFavorites ? _self.showOnlyFavorites : showOnlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Pokemon> pokemon,  bool isLoading,  String? error,  int totalCount,  bool hasNext,  Set<int> favoriteIds,  bool showOnlyFavorites,  String searchQuery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.pokemon,_that.isLoading,_that.error,_that.totalCount,_that.hasNext,_that.favoriteIds,_that.showOnlyFavorites,_that.searchQuery);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Pokemon> pokemon,  bool isLoading,  String? error,  int totalCount,  bool hasNext,  Set<int> favoriteIds,  bool showOnlyFavorites,  String searchQuery)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.pokemon,_that.isLoading,_that.error,_that.totalCount,_that.hasNext,_that.favoriteIds,_that.showOnlyFavorites,_that.searchQuery);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Pokemon> pokemon,  bool isLoading,  String? error,  int totalCount,  bool hasNext,  Set<int> favoriteIds,  bool showOnlyFavorites,  String searchQuery)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.pokemon,_that.isLoading,_that.error,_that.totalCount,_that.hasNext,_that.favoriteIds,_that.showOnlyFavorites,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({required final  List<Pokemon> pokemon, required this.isLoading, required this.error, required this.totalCount, required this.hasNext, required final  Set<int> favoriteIds, required this.showOnlyFavorites, required this.searchQuery}): _pokemon = pokemon,_favoriteIds = favoriteIds;
  

 final  List<Pokemon> _pokemon;
@override List<Pokemon> get pokemon {
  if (_pokemon is EqualUnmodifiableListView) return _pokemon;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokemon);
}

@override final  bool isLoading;
@override final  String? error;
@override final  int totalCount;
@override final  bool hasNext;
 final  Set<int> _favoriteIds;
@override Set<int> get favoriteIds {
  if (_favoriteIds is EqualUnmodifiableSetView) return _favoriteIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_favoriteIds);
}

@override final  bool showOnlyFavorites;
@override final  String searchQuery;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._pokemon, _pokemon)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&const DeepCollectionEquality().equals(other._favoriteIds, _favoriteIds)&&(identical(other.showOnlyFavorites, showOnlyFavorites) || other.showOnlyFavorites == showOnlyFavorites)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pokemon),isLoading,error,totalCount,hasNext,const DeepCollectionEquality().hash(_favoriteIds),showOnlyFavorites,searchQuery);

@override
String toString() {
  return 'HomeState(pokemon: $pokemon, isLoading: $isLoading, error: $error, totalCount: $totalCount, hasNext: $hasNext, favoriteIds: $favoriteIds, showOnlyFavorites: $showOnlyFavorites, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<Pokemon> pokemon, bool isLoading, String? error, int totalCount, bool hasNext, Set<int> favoriteIds, bool showOnlyFavorites, String searchQuery
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemon = null,Object? isLoading = null,Object? error = freezed,Object? totalCount = null,Object? hasNext = null,Object? favoriteIds = null,Object? showOnlyFavorites = null,Object? searchQuery = null,}) {
  return _then(_HomeState(
pokemon: null == pokemon ? _self._pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,favoriteIds: null == favoriteIds ? _self._favoriteIds : favoriteIds // ignore: cast_nullable_to_non_nullable
as Set<int>,showOnlyFavorites: null == showOnlyFavorites ? _self.showOnlyFavorites : showOnlyFavorites // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

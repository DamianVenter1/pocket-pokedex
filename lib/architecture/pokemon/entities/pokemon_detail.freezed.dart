// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonDetail {

 int get id; String get name; String get imageUrl; String get description; List<String> get types; List<PokemonStat> get stats;
/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonDetailCopyWith<PokemonDetail> get copyWith => _$PokemonDetailCopyWithImpl<PokemonDetail>(this as PokemonDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.types, types)&&const DeepCollectionEquality().equals(other.stats, stats));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,description,const DeepCollectionEquality().hash(types),const DeepCollectionEquality().hash(stats));

@override
String toString() {
  return 'PokemonDetail(id: $id, name: $name, imageUrl: $imageUrl, description: $description, types: $types, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $PokemonDetailCopyWith<$Res>  {
  factory $PokemonDetailCopyWith(PokemonDetail value, $Res Function(PokemonDetail) _then) = _$PokemonDetailCopyWithImpl;
@useResult
$Res call({
 int id, String name, String imageUrl, String description, List<String> types, List<PokemonStat> stats
});




}
/// @nodoc
class _$PokemonDetailCopyWithImpl<$Res>
    implements $PokemonDetailCopyWith<$Res> {
  _$PokemonDetailCopyWithImpl(this._self, this._then);

  final PokemonDetail _self;
  final $Res Function(PokemonDetail) _then;

/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? description = null,Object? types = null,Object? stats = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStat>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonDetail].
extension PokemonDetailPatterns on PokemonDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonDetail value)  $default,){
final _that = this;
switch (_that) {
case _PokemonDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  String description,  List<String> types,  List<PokemonStat> stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.types,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  String description,  List<String> types,  List<PokemonStat> stats)  $default,) {final _that = this;
switch (_that) {
case _PokemonDetail():
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.types,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String imageUrl,  String description,  List<String> types,  List<PokemonStat> stats)?  $default,) {final _that = this;
switch (_that) {
case _PokemonDetail() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.types,_that.stats);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonDetail implements PokemonDetail {
  const _PokemonDetail({required this.id, required this.name, required this.imageUrl, required this.description, required final  List<String> types, required final  List<PokemonStat> stats}): _types = types,_stats = stats;
  

@override final  int id;
@override final  String name;
@override final  String imageUrl;
@override final  String description;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

 final  List<PokemonStat> _stats;
@override List<PokemonStat> get stats {
  if (_stats is EqualUnmodifiableListView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stats);
}


/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonDetailCopyWith<_PokemonDetail> get copyWith => __$PokemonDetailCopyWithImpl<_PokemonDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._types, _types)&&const DeepCollectionEquality().equals(other._stats, _stats));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,description,const DeepCollectionEquality().hash(_types),const DeepCollectionEquality().hash(_stats));

@override
String toString() {
  return 'PokemonDetail(id: $id, name: $name, imageUrl: $imageUrl, description: $description, types: $types, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$PokemonDetailCopyWith<$Res> implements $PokemonDetailCopyWith<$Res> {
  factory _$PokemonDetailCopyWith(_PokemonDetail value, $Res Function(_PokemonDetail) _then) = __$PokemonDetailCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String imageUrl, String description, List<String> types, List<PokemonStat> stats
});




}
/// @nodoc
class __$PokemonDetailCopyWithImpl<$Res>
    implements _$PokemonDetailCopyWith<$Res> {
  __$PokemonDetailCopyWithImpl(this._self, this._then);

  final _PokemonDetail _self;
  final $Res Function(_PokemonDetail) _then;

/// Create a copy of PokemonDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? description = null,Object? types = null,Object? stats = null,}) {
  return _then(_PokemonDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,stats: null == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as List<PokemonStat>,
  ));
}


}

/// @nodoc
mixin _$PokemonStat {

 String get name; int get value;
/// Create a copy of PokemonStat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonStatCopyWith<PokemonStat> get copyWith => _$PokemonStatCopyWithImpl<PokemonStat>(this as PokemonStat, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonStat&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'PokemonStat(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class $PokemonStatCopyWith<$Res>  {
  factory $PokemonStatCopyWith(PokemonStat value, $Res Function(PokemonStat) _then) = _$PokemonStatCopyWithImpl;
@useResult
$Res call({
 String name, int value
});




}
/// @nodoc
class _$PokemonStatCopyWithImpl<$Res>
    implements $PokemonStatCopyWith<$Res> {
  _$PokemonStatCopyWithImpl(this._self, this._then);

  final PokemonStat _self;
  final $Res Function(PokemonStat) _then;

/// Create a copy of PokemonStat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? value = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonStat].
extension PokemonStatPatterns on PokemonStat {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PokemonStat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PokemonStat() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PokemonStat value)  $default,){
final _that = this;
switch (_that) {
case _PokemonStat():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PokemonStat value)?  $default,){
final _that = this;
switch (_that) {
case _PokemonStat() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PokemonStat() when $default != null:
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int value)  $default,) {final _that = this;
switch (_that) {
case _PokemonStat():
return $default(_that.name,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int value)?  $default,) {final _that = this;
switch (_that) {
case _PokemonStat() when $default != null:
return $default(_that.name,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _PokemonStat implements PokemonStat {
  const _PokemonStat({required this.name, required this.value});
  

@override final  String name;
@override final  int value;

/// Create a copy of PokemonStat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PokemonStatCopyWith<_PokemonStat> get copyWith => __$PokemonStatCopyWithImpl<_PokemonStat>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PokemonStat&&(identical(other.name, name) || other.name == name)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,name,value);

@override
String toString() {
  return 'PokemonStat(name: $name, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PokemonStatCopyWith<$Res> implements $PokemonStatCopyWith<$Res> {
  factory _$PokemonStatCopyWith(_PokemonStat value, $Res Function(_PokemonStat) _then) = __$PokemonStatCopyWithImpl;
@override @useResult
$Res call({
 String name, int value
});




}
/// @nodoc
class __$PokemonStatCopyWithImpl<$Res>
    implements _$PokemonStatCopyWith<$Res> {
  __$PokemonStatCopyWithImpl(this._self, this._then);

  final _PokemonStat _self;
  final $Res Function(_PokemonStat) _then;

/// Create a copy of PokemonStat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? value = null,}) {
  return _then(_PokemonStat(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

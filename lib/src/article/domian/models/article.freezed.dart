// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Article _$ArticleFromJson(Map<String, dynamic> json) {
return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {

 String get title => throw _privateConstructorUsedError; String get content => throw _privateConstructorUsedError; String get authorId => throw _privateConstructorUsedError;// Referência ao usuário
 String get thumbnailUrl => throw _privateConstructorUsedError; DateTime get publishedAt => throw _privateConstructorUsedError; String get category => throw _privateConstructorUsedError; String get status => throw _privateConstructorUsedError; int get views => throw _privateConstructorUsedError; int get likes => throw _privateConstructorUsedError;






/// Serializes this Article to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ArticleCopyWith<$Res>  {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) = _$ArticleCopyWithImpl<$Res, Article>;
@useResult
$Res call({
 String title, String content, String authorId, String thumbnailUrl, DateTime publishedAt, String category, String status, int views, int likes
});



}

/// @nodoc
class _$ArticleCopyWithImpl<$Res,$Val extends Article> implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? authorId = null,Object? thumbnailUrl = null,Object? publishedAt = null,Object? category = null,Object? status = null,Object? views = null,Object? likes = null,}) {
  return _then(_value.copyWith(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _value.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _value.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _value.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _value.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _value.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _value.likes : likes // ignore: cast_nullable_to_non_nullable
as int,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(_$ArticleImpl value, $Res Function(_$ArticleImpl) then) = __$$ArticleImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 String title, String content, String authorId, String thumbnailUrl, DateTime publishedAt, String category, String status, int views, int likes
});



}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res> extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl> implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(_$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
      : super(_value, _then);


/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,Object? authorId = null,Object? thumbnailUrl = null,Object? publishedAt = null,Object? category = null,Object? status = null,Object? views = null,Object? likes = null,}) {
  return _then(_$ArticleImpl(
title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _value.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _value.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _value.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,publishedAt: null == publishedAt ? _value.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as String,views: null == views ? _value.views : views // ignore: cast_nullable_to_non_nullable
as int,likes: null == likes ? _value.likes : likes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ArticleImpl  with DiagnosticableTreeMixin implements _Article {
  const _$ArticleImpl({required this.title, required this.content, required this.authorId, required this.thumbnailUrl, required this.publishedAt, required this.category, required this.status, required this.views, required this.likes});

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) => _$$ArticleImplFromJson(json);

@override final  String title;
@override final  String content;
@override final  String authorId;
// Referência ao usuário
@override final  String thumbnailUrl;
@override final  DateTime publishedAt;
@override final  String category;
@override final  String status;
@override final  int views;
@override final  int likes;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Article(title: $title, content: $content, authorId: $authorId, thumbnailUrl: $thumbnailUrl, publishedAt: $publishedAt, category: $category, status: $status, views: $views, likes: $likes)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'Article'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('content', content))..add(DiagnosticsProperty('authorId', authorId))..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl))..add(DiagnosticsProperty('publishedAt', publishedAt))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('views', views))..add(DiagnosticsProperty('likes', likes));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _$ArticleImpl&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.views, views) || other.views == views)&&(identical(other.likes, likes) || other.likes == likes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,content,authorId,thumbnailUrl,publishedAt,category,status,views,likes);

/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ArticleImplCopyWith<_$ArticleImpl> get copyWith => __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ArticleImplToJson(this, );
}
}


abstract class _Article implements Article {
  const factory _Article({required final  String title, required final  String content, required final  String authorId, required final  String thumbnailUrl, required final  DateTime publishedAt, required final  String category, required final  String status, required final  int views, required final  int likes}) = _$ArticleImpl;
  

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

@override String get title;@override String get content;@override String get authorId;// Referência ao usuário
@override String get thumbnailUrl;@override DateTime get publishedAt;@override String get category;@override String get status;@override int get views;@override int get likes;
/// Create a copy of Article
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ArticleImplCopyWith<_$ArticleImpl> get copyWith => throw _privateConstructorUsedError;

}

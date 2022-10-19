// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      director: json['director'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
              const {},
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'director': instance.director,
      'summary': instance.summary,
      'genres': instance.genres.toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      movies: (json['movies'] as List<dynamic>)
          .map((e) => MoviesData.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'genres': instance.genres,
    };

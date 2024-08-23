// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesData _$MoviesDataFromJson(Map<String, dynamic> json) => MoviesData(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      genre: json['genre'] as String,
    );

Map<String, dynamic> _$MoviesDataToJson(MoviesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'genre': instance.genre,
    };

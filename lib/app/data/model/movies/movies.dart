// ignore_for_file: depend_on_referenced_packages

import 'package:delfosti_app/app/data/model/movies/movies_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable(explicitToJson: true)
class Movies {
  List<MoviesData> movies;
  List<String> genres;

  Movies({
    required this.movies,
    required this.genres,
  });

  factory Movies.fromJson(Map<String, dynamic> data) => _$MoviesFromJson(data);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}

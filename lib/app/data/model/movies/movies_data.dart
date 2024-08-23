// ignore_for_file: depend_on_referenced_packages

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies_data.g.dart';

@JsonSerializable(explicitToJson: true)
class MoviesData {
  int id;
  String title;
  String description;
  String genre;
  RxBool isLiked = RxBool(false); // Para el estado de "me gusta"
  RxBool isDisliked = RxBool(false); // Para el estado de "no me gusta"

  MoviesData({
    required this.id,
    required this.title,
    required this.description,
    required this.genre,
  });

  factory MoviesData.fromJson(Map<String, dynamic> data) =>
      _$MoviesDataFromJson(data);

  Map<String, dynamic> toJson() => _$MoviesDataToJson(this);
}

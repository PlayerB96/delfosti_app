// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'units_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UnitData {
  String plate;
  int unitName;
  String date;
  int laps;
  int stops;

  UnitData({
    required this.plate,
    required this.unitName,
    required this.date,
    required this.laps,
    required this.stops,
  });

  factory UnitData.fromJson(Map<String, dynamic> data) =>
      _$UnitDataFromJson(data);

  Map<String, dynamic> toJson() => _$UnitDataToJson(this);
}

// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

import 'units_data.dart';
part 'units.g.dart';

@JsonSerializable(explicitToJson: true)
class Units {
  String message;
  bool status;
  List<UnitData> data;

  Units({
    required this.message,
    required this.status,
    required this.data,
  });

  factory Units.fromJson(Map<String, dynamic> data) => _$UnitsFromJson(data);

  Map<String, dynamic> toJson() => _$UnitsToJson(this);
}

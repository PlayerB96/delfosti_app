// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnitData _$UnitDataFromJson(Map<String, dynamic> json) => UnitData(
      plate: json['plate'] as String,
      unitName: json['unitName'] as int,
      date: json['date'] as String,
      laps: json['laps'] as int,
      stops: json['stops'] as int,
    );

Map<String, dynamic> _$UnitDataToJson(UnitData instance) => <String, dynamic>{
      'plate': instance.plate,
      'unitName': instance.unitName,
      'date': instance.date,
      'laps': instance.laps,
      'stops': instance.stops,
    };

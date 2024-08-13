// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'units.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Units _$UnitsFromJson(Map<String, dynamic> json) => Units(
      message: json['message'] as String,
      status: json['status'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => UnitData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UnitsToJson(Units instance) => <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

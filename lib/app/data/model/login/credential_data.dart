import 'package:json_annotation/json_annotation.dart';

part 'credential_data.g.dart';

@JsonSerializable(explicitToJson: true)
class CredentialData {
  String user;
  String password;
  String rol;
  bool status;
  String code;
  String business;
  String token;

  CredentialData({
    required this.user,
    required this.password,
    required this.rol,
    required this.status,
    required this.code,
    required this.business,
    required this.token,
  });

  factory CredentialData.fromJson(Map<String, dynamic> data) =>
      _$CredentialDataFromJson(data);

  Map<String, dynamic> toJson() => _$CredentialDataToJson(this);
}

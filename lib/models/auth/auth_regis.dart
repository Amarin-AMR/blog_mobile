// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'auth_regis.g.dart';

@JsonSerializable()
class AuthRegis {
  @JsonKey(name: 'name')
  String? mobileNumber;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'createAt')
  DateTime? createAt;

  AuthRegis({
    this.mobileNumber,
    this.email,
    this.username,
    this.createAt,
  });

  factory AuthRegis.fromJson(Map<String, dynamic> json) =>
      _$AuthRegisFromJson(json);

  Map<String, dynamic> toJson() => _$AuthRegisToJson(this);
}

// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'auth_login.g.dart';

@JsonSerializable()
class AuthLogin {
  @JsonKey(name: 'access_token', defaultValue: '')
  String? token;

  AuthLogin({
    this.token,
  });

  factory AuthLogin.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginFromJson(json);

  Map<String, dynamic> toJson() => _$AuthLoginToJson(this);
}

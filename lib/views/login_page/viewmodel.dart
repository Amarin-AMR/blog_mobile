import 'package:blog_mobile/base/base_viewmodel.dart';
import 'package:blog_mobile/models/auth/auth_login.dart';
import 'package:blog_mobile/repository/auth_repository.dart';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  final AuthenticationRepository _authenticatorResponse =
      AuthenticationRepository();

  LoginViewModel({required BuildContext context});

  String _username = '';

  String _password = '';

  String _token = '';

  Map<String, dynamic>? _decodeToken;

  String get username => _username;

  String get password => _password;

  set username(String value) {
    _username = value;
  }

  set password(String value) {
    _password = value;
  }

  Future<AuthLogin> loginData() async {
    loading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var response =
        await _authenticatorResponse.requestLogin(_username, _password);

    if (response.token != null) {
      _token = response.token!;
      _decodeToken = JwtDecoder.decode(_token);
      await prefs.setInt('token', _decodeToken!['id']);
      // debugPrint(decodeToken?['id'].toString());
    }
    loading = false;

    return response;
  }
}

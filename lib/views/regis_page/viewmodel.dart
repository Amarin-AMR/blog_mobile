import 'package:blog_mobile/base/base_viewmodel.dart';
import 'package:blog_mobile/models/auth/auth_regis.dart';
import 'package:blog_mobile/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class RegisViewModel extends BaseViewModel {
  final AuthenticationRepository _authenticatorResponse =
      AuthenticationRepository();

  RegisViewModel({required BuildContext context});

  String _name = '';
  String _username = '';
  String _email = '';
  String _password = '';

  set email(String value) {
    _email = value;
  }

  set username(String value) {
    _username = value;
  }

  set name(String value) {
    _name = value;
  }

  set password(String value) {
    _password = value;
  }

  Future<AuthRegis> regisData() async {
    loading = true;
    var response = await _authenticatorResponse.requestRegister(
        _email, _username, _password, _name);
    loading = false;

    return response;
  }
}

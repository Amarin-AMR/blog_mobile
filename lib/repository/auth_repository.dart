import 'package:blog_mobile/models/auth/auth_login.dart';
import 'package:blog_mobile/models/auth/auth_regis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  final _dio = Dio();
  final String _regisPath = "http://localhost:3000/auth/regiter";
  final String _loginPath = "http://localhost:3000/auth/login";

  Future<AuthRegis> requestRegister(
    String email,
    String username,
    String password,
    String name,
  ) async {
    try {
      var response = await _dio.post(
        _regisPath,
        data: {
          "email": email,
          "username": username,
          "password": password,
          "name": name
        },
      );
      return AuthRegis.fromJson(response.data ?? {});
    } on DioException catch (e) {
      debugPrint(e.toString());
      return AuthRegis.fromJson({"error": e});
    }
  }

  Future<AuthLogin> requestLogin(
    String username,
    String password,
  ) async {
    try {
      var response = await _dio.post(
        _loginPath,
        data: {
          "username": username,
          "password": password,
        },
      );
      return AuthLogin.fromJson(response.data ?? {});
    } on DioException catch (e) {
      debugPrint(e.toString());
      return AuthLogin.fromJson({"error": e});
    }
  }
}

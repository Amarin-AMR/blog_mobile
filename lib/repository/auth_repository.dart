import 'package:blog_mobile/models/auth/auth_regis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  final _dio = Dio();
  final String _regisPath = "http://localhost:3000/auth/regiter";

  Future<AuthRegis> requestRegister(
      String email, String username, String password, String name) async {
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
      throw Exception('An error occured: $e');
    }
  }
}
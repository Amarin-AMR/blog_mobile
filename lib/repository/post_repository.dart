import 'package:blog_mobile/models/posts/post_list_response.dart';
import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  final _dio = Dio();
  final String _postPath = "http://localhost:3000/posts";

  Future<PostModel> createPost(
      String title, String content, int authorId) async {
    try {
      var response = await _dio.post(
        '$_postPath/create',
        data: {
          "title": title,
          "content": content,
          "authorId": authorId,
        },
      );
      return PostModel.fromJson(response.data ?? {});
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw Exception('An error occured: $e');
    }
  }

  Future<PostListResponse> showPost() async {
    try {
      var response = await _dio.get(
        _postPath,
      );
      return PostListResponse.fromJson(response.data ?? {});
    } on DioException catch (e) {
      debugPrint(e.toString());
      throw Exception('An error occured: $e');
    }
  }
}

import 'package:blog_mobile/models/posts/post_create.dart';

import 'package:blog_mobile/models/posts/post_list_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PostRepository {
  final _dio = Dio();
  final String _postPath = "http://localhost:3000/posts";

  Future<PostCreateResponse> createPost(
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
      return PostCreateResponse.fromJson(response.data ?? {});
    } on DioException catch (e) {
      debugPrint(e.toString());
      return PostCreateResponse.fromJson({"error": e});
    }
  }

  Future<PostListResponse> showPost() async {
    try {
      var response = await _dio.get(
        _postPath,
      );
      return PostListResponse.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint(e.toString());
      return PostListResponse.fromJson({"error": e});
    }
  }
}

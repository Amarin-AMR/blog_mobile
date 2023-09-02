import 'package:blog_mobile/base/base_viewmodel.dart';

import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:blog_mobile/repository/post_repository.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogViewModel extends BaseViewModel {
  final PostRepository _postResponse = PostRepository();

  BlogViewModel({required BuildContext context});

  final String _token = '';

  List<PostModel>? _listPost;

  List<PostModel>? get listPost => _listPost ?? [];

  Future<void> postData() async {
    loading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final int? token = prefs.getInt('token');
    var response = await _postResponse.showPost();
    _listPost = response.listPost;
    print(response);

    loading = false;
  }
}

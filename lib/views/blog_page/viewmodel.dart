import 'package:blog_mobile/base/base_viewmodel.dart';

import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:blog_mobile/repository/post_repository.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlogViewModel extends BaseViewModel {
  final PostRepository _postResponse = PostRepository();

  BlogViewModel({required BuildContext context});

  String _title = '';

  String _content = '';

  List<PostModel>? _listPost;

  List<PostModel>? get listPost => _listPost ?? [];

  String get title => _title;

  String get content => _content;

  set title(String value) {
    _title = value;
  }

  set content(String value) {
    _content = value;
  }

  Future<void> postData() async {
    loading = true;
    var response = await _postResponse.showPost();
    _listPost = response.listPost;
    // debugPrint(response);

    loading = false;
  }

  Future<void> addPost(String title, String content) async {
    loading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? token = prefs.getInt('token');

    await _postResponse.createPost(title, content, token ?? 0);
    var response = await _postResponse.showPost();
    _listPost = response.listPost;

    debugPrint('create success');

    loading = false;
  }
}

// External Modules
import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_create.g.dart';

@JsonSerializable()
class PostCreateResponse {
  @JsonKey(name: 'message')
  String? msg;

  @JsonKey(name: 'createPost')
  PostModel? createPost;

  PostCreateResponse({
    this.msg,
    this.createPost,
  });

  factory PostCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$PostCreateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostCreateResponseToJson(this);
}

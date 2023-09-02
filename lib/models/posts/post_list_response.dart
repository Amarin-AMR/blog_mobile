// External Modules
import 'package:blog_mobile/models/posts/post_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_list_response.g.dart';

@JsonSerializable()
class PostListResponse {
  @JsonKey(name: 'post', defaultValue: [])
  List<PostModel>? listPost;

  PostListResponse({
    this.listPost,
  });

  factory PostListResponse.fromJson(Map<String, dynamic> json) =>
      _$PostListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostListResponseToJson(this);
}

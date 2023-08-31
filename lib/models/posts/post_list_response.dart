// External Modules
import 'package:json_annotation/json_annotation.dart';

part 'post_list_response.g.dart';

@JsonSerializable()
class PostListResponse {
  @JsonKey(name: 'message')
  String? msg;

  @JsonKey(name: 'createPost', defaultValue: [])
  List<PostListResponse>? createPost;

  PostListResponse({
    this.msg,
    this.createPost,
  });

  factory PostListResponse.fromJson(Map<String, dynamic> json) =>
      _$PostListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostListResponseToJson(this);
}

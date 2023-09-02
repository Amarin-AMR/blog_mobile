// External Modules
import 'package:blog_mobile/models/auth/auth_regis.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: 'authorId')
  int? authorId;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'author')
  AuthRegis? author;

  PostModel({
    this.authorId,
    this.title,
    this.content,
    this.author,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}

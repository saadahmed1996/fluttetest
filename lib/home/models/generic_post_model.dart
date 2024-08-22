// To parse this JSON data, do
//
//     final genericPostModel = genericPostModelFromJson(jsonString);

import 'dart:convert';

GenericPostModel genericPostModelFromJson(String str) =>
    GenericPostModel.fromJson(json.decode(str));

String genericPostModelToJson(GenericPostModel data) =>
    json.encode(data.toJson());

class GenericPostModel {
  List<Post>? posts;
  int? total;
  int? skip;
  int? limit;

  GenericPostModel({
    this.posts,
    this.total,
    this.skip,
    this.limit,
  });

  factory GenericPostModel.fromJson(Map<String, dynamic> json) =>
      GenericPostModel(
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Post {
  final int id;
  final String title;
  final String body;
  List<String>? tags;
  Reactions? reactions;
  final int views;
  final int userId;

  Post({
    this.id = 0,
    this.title = "",
    this.body = "",
    this.tags,
    this.reactions,
    this.views = 0,
    this.userId = 0,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"] ?? 0,
        title: json["title"] ?? '',
        body: json["body"] ?? '',
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        reactions: json["reactions"] == null
            ? null
            : Reactions.fromJson(json["reactions"]),
        views: json["views"] ?? 0,
        userId: json["userId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "reactions": reactions?.toJson(),
        "views": views,
        "userId": userId,
      };
}

class Reactions {
  final int likes;
  final int dislikes;

  Reactions({
    this.likes = 0,
    this.dislikes = 0,
  });

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions(
        likes: json["likes"] ?? 0,
        dislikes: json["dislikes"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "dislikes": dislikes,
      };
}

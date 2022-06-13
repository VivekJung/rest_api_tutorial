// To parse this JSON data, do
//
//     final UserPosts = UserPostsFromJson(jsonString);

import 'dart:convert';

List<UserPosts> userPostsFromJson(String str) =>
    List<UserPosts>.from(json.decode(str).map((x) => UserPosts.fromJson(x)));

String userPostsToJson(List<UserPosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPosts {
  UserPosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String? body;

  factory UserPosts.fromJson(Map<String, dynamic> json) => UserPosts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

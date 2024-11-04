import 'dart:convert';

class Comment {
  String userName;
  String content;

  Comment({
    required this.userName,
    required this.content,
  });

  // Convert a Comment into a Map.
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'content': content,
    };
  }

  // Convert a Map into a Comment.
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      userName: json['userName'],
      content: json['content'],
    );
  }
}

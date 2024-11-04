import 'dart:convert';
import 'menu.dart';
import 'comment.dart';

class Restaurant {
  String name;
  String description;
  String location;
  String img;
  int likes;
  List<Menu> menu;
  List<Comment> comments; // Add the comments field

  Restaurant({
    required this.name,
    required this.description,
    required this.location,
    required this.img,
    required this.likes,
    required this.menu,
    required this.comments, // Initialize the comments
  });

  // Convert a Restaurant into a Map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'location': location,
      'img': img,
      'likes': likes,
      'menu': menu.map((m) => m.toJson()).toList(),
      'comments':
          comments.map((c) => c.toJson()).toList(), // Serialize comments
    };
  }

  // Convert a Map into a Restaurant.
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      description: json['description'],
      location: json['location'],
      img: json['img'],
      likes: json['likes'],
      menu: (json['menu'] as List).map((m) => Menu.fromJson(m)).toList(),
      comments: (json['comments'] as List)
          .map((c) => Comment.fromJson(c))
          .toList(), // Deserialize comments
    );
  }
}

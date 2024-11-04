// models.dart

// Model representing a single menu item
class MenuItem {
  String name; // The name of the menu item
  String description; // A brief description of the menu item
  double price; // The price of the menu item

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
  });

  // Convert a MenuItem object to a JSON object for storage
  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'price': price,
      };

  // Create a MenuItem object from a JSON object
  MenuItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        price = json['price'].toDouble();
}

// Model representing a restaurant
class Restaurant {
  String name;
  String description;
  String location;
  String img;
  List<MenuItem> menu;
  int likes;
  List<Comment> comments;

  Restaurant({
    required this.name,
    required this.description,
    required this.location,
    required this.img,
    required this.menu,
    this.likes = 0,
    required this.comments,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'location': location,
        'img': img,
        'menu': menu.map((item) => item.toJson()).toList(),
        'likes': likes,
        'comments': comments.map((comment) => comment.toJson()).toList(),
      };

  Restaurant.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        location = json['location'],
        img = json['img'],
        menu = List<MenuItem>.from(
            json['menu'].map((item) => MenuItem.fromJson(item))),
        likes = json['likes'] ?? 0,
        comments = List<Comment>.from(
            json['comments'].map((item) => Comment.fromJson(item)));
}

// Model representing a user comment
class Comment {
  String userName; // Name of the user who left the comment
  String content; // Content of the comment

  Comment({
    required this.userName,
    required this.content,
  });

  // Convert a Comment object to a JSON object for storage
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'content': content,
      };

  // Create a Comment object from a JSON object
  Comment.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        content = json['content'];
}

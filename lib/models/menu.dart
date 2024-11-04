import 'dart:convert';

class Menu {
  String name;
  String description;
  double price;

  Menu({
    required this.name,
    required this.description,
    required this.price,
  });

  // Convert a Menu into a Map.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
    };
  }

  // Convert a Map into a Menu.
  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}

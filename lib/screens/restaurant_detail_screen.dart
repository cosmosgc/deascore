import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/CommentsScreen.dart'; // Import the new comments screen

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;
  final int index; // Add an index parameter

  RestaurantDetailScreen(
      {super.key, required this.restaurant, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Column(
        children: [
          Hero(
            tag: 'restaurantImage$index', // Same tag as in the list screen
            child: Image.network(
              restaurant.img,
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image.asset('assets/default_image.jpg');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(restaurant.description),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Location: ${restaurant.location}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Likes: ${restaurant.likes}'),
          ),
          // Display the restaurant menu
          Expanded(
            child: ListView.builder(
              itemCount: restaurant.menu.length,
              itemBuilder: (context, index) {
                final menuItem = restaurant.menu[index];
                return ListTile(
                  title: Text(menuItem.name),
                  subtitle: Text(menuItem.description),
                  trailing: Text('\$${menuItem.price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Button to navigate to comments screen
          ElevatedButton(
            onPressed: () {
              // Navigate to comments screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RestaurantCommentsScreen(comments: restaurant.comments),
                ),
              );
            },
            child: Text('View Comments'),
          ),
        ],
      ),
    );
  }
}

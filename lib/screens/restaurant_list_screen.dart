import 'package:deascore/screens/restaurant_edit_screen.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../services/storage_service.dart';
import 'restaurant_detail_screen.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final StorageService _storageService = StorageService();
  List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _loadRestaurants();
  }

  Future<void> _loadRestaurants() async {
    List<Restaurant> restaurants = await _storageService.loadRestaurants();
    setState(() {
      _restaurants = restaurants;
      print(_restaurants);
    });
  }

  Future<void> _navigateToEditScreen() async {
    final newRestaurant = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RestaurantEditScreen()),
    );

    if (newRestaurant != null) {
      _restaurants.add(newRestaurant);
      await _storageService.saveRestaurants(_restaurants);
      _loadRestaurants();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants')),
      body: _restaurants.isEmpty
          ? const Center(child: Text('No Restaurants Available'))
          : ListView.builder(
              itemCount: _restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = _restaurants[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: Hero(
                      tag:
                          'restaurantImage$index', // Unique tag for each restaurant image
                      child: Image.network(
                        restaurant.img,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/default_image.jpg',
                              width: 50, height: 50, fit: BoxFit.cover);
                        },
                      ),
                    ),
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.description),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailScreen(
                              restaurant: restaurant, index: index),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToEditScreen,
        child: const Icon(Icons.add),
      ),
    );
  }
}

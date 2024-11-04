// storage_service.dart
import 'package:localstorage/localstorage.dart';
import '../models/models.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StorageService {
  final LocalStorage storage = LocalStorage('restaurant_app');
  final String apiUrl = 'http://localhost:8000/api/restaurants';

  Future<void> saveRestaurants(List<Restaurant> restaurants) async {
    List<Map<String, dynamic>> jsonList =
        restaurants.map((restaurant) => restaurant.toJson()).toList();
    await storage.setItem('restaurants', jsonList);
  }

  Future<List<Restaurant>> loadRestaurants() async {
    try {
      // First, try fetching from the web API
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonResponse['restaurants'] ?? [];
        final List<Restaurant> restaurants =
            jsonList.map((json) => Restaurant.fromJson(json)).toList();

        // Store fetched restaurants in local storage
        await storage.ready;
        await storage.setItem('restaurants', jsonList);

        return restaurants;
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      // If API call fails, try loading from local storage
      await storage.ready;
      final jsonList =
          await storage.getItem('restaurants') as List<dynamic>? ?? [];
      return jsonList.map((json) => Restaurant.fromJson(json)).toList();
    }
  }
}

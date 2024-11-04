import 'package:flutter/material.dart';
import '../models/models.dart';

class RestaurantEditScreen extends StatefulWidget {
  const RestaurantEditScreen({super.key});

  @override
  _RestaurantEditScreenState createState() => _RestaurantEditScreenState();
}

class _RestaurantEditScreenState extends State<RestaurantEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();

  final List<MenuItem> _menuItems = [];
  final List<Comment> _comments = [];

  // Add a menu item
  void _addMenuItem() {
    _menuItems.add(MenuItem(name: '', description: '', price: 0));
    setState(() {});
  }

  // Add a comment
  void _addComment() {
    _comments.add(Comment(userName: '', content: ''));
    setState(() {});
  }

  // Save the restaurant, comments can be none (optional)
  void _saveRestaurant() {
    final restaurant = Restaurant(
      name: _nameController.text,
      description: _descriptionController.text,
      location: _locationController.text,
      img: _imgController.text,
      menu: _menuItems,
      comments: _comments, // Comments will be passed as is (optional)
    );
    Navigator.pop(context, restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add/Edit Restaurant')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name input
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Restaurant Name'),
            ),

            // Description input
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),

            // Location input
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),

            // Image URL input
            TextField(
              controller: _imgController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),

            SizedBox(height: 16),

            // Menu items section
            Text('Menu Items:'),
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final menuItem = _menuItems[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Menu item name input
                          TextField(
                            onChanged: (value) => menuItem.name = value,
                            decoration:
                                InputDecoration(labelText: 'Menu Item Name'),
                          ),

                          // Menu item description input
                          TextField(
                            onChanged: (value) => menuItem.description = value,
                            decoration:
                                InputDecoration(labelText: 'Description'),
                          ),

                          // Menu item price input
                          TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (value) =>
                                menuItem.price = double.tryParse(value) ?? 0,
                            decoration: InputDecoration(labelText: 'Price'),
                          ),

                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: _addMenuItem,
              child: Text('Add Menu Item'),
            ),

            SizedBox(height: 16),

            // Comments section (optional)
            Text('Comments (Optional):'),
            Expanded(
              child: ListView.builder(
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  final comment = _comments[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Comment user name input
                          TextField(
                            onChanged: (value) => comment.userName = value,
                            decoration: InputDecoration(labelText: 'User Name'),
                          ),

                          // Comment content input
                          TextField(
                            onChanged: (value) => comment.content = value,
                            decoration:
                                InputDecoration(labelText: 'Comment Content'),
                          ),

                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            ElevatedButton(
              onPressed: _addComment,
              child: Text('Add Comment'),
            ),

            SizedBox(height: 16),

            // Save button
            ElevatedButton(
              onPressed: _saveRestaurant,
              child: Text('Save Restaurant'),
            ),
          ],
        ),
      ),
    );
  }
}

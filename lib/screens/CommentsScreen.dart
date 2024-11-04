import 'package:flutter/material.dart';
import '../models/models.dart';

class RestaurantCommentsScreen extends StatelessWidget {
  final List<Comment> comments;

  RestaurantCommentsScreen({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: comments.isNotEmpty
          ? ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return ListTile(
                  title: Text(comment.userName),
                  subtitle: Text(comment.content),
                );
              },
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('No comments available.'),
              ),
            ),
    );
  }
}

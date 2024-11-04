import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
      ),
      body: Center(
        child: Text(
          'Configuration settings will be here',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

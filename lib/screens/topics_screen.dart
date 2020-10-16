import 'package:flutter/material.dart';

class TopicsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('topics'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Topics about this app...'),
      ),
    );
  }
}

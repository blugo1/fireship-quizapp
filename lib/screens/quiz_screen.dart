import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('quiz'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Quiz about this app...'),
      ),
    );
  }
}

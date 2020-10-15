import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 150,
                      color: Colors.red,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.red,
                        ),
                        Container(
                          height: 5,
                          width: 150,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 75,
                      color: Colors.blue,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

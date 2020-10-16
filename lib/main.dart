//Flutter
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

//Screens
import 'screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TurnOff DebugFlag
      debugShowCheckedModeBanner: false,

      //Firebase Analytics
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
      ],

      //Navigation Routes
      routes: {
        '/': (context) => LoginScreen(),
        '/topics': (context) => TopicsScreen(),
        '/profile': (context) => ProfileScreen(),
        '/about': (context) => AboutScreen(),
      },

      //Application Theme
      theme: ThemeData(
        fontFamily: 'Nunito',
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.black87,
        ),
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 18),
          bodyText2: TextStyle(fontSize: 16),
          button: TextStyle(letterSpacing: 1.5, fontWeight: FontWeight.bold),
          headline1: TextStyle(fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

//Flutter
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

//Packages
import 'package:provider/provider.dart';

//Services
import 'services/services.dart';

//Screens
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //Provider
      providers: [
        StreamProvider<Report>.value(value: Global.reportRef.documentStream),
        StreamProvider<User>.value(value: AuthService().user),
      ],

      child: MaterialApp(
        //TurnOff DebugFlag
        debugShowCheckedModeBanner: false,

        //Firebase Analytics
        navigatorObservers: [
          FirebaseAnalyticsObserver(
            analytics: FirebaseAnalytics(),
          )
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
            headline1: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            subtitle1: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

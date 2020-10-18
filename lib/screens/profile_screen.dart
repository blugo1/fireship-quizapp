//Flutter
import 'package:flutter/material.dart';

//Firebase
import 'package:firebase_auth/firebase_auth.dart';

//Packages
import 'package:provider/provider.dart';

//Services
import '../services/services.dart';

class ProfileScreen extends StatelessWidget {
  final AuthService auth = AuthService();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: FlatButton(
          child: Text('Logout'),
          color: Colors.red,
          onPressed: () async {
            await auth.signOut();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
        ),
      ),
    );
  }
}

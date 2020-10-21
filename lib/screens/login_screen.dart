//Flutter
import 'package:flutter/material.dart';

//Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:apple_sign_in/apple_sign_in.dart';

//Firebse
import 'package:firebase_auth/firebase_auth.dart';

//Services
import '../services/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthService auth = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (auth.user != null) {
      Navigator.pushReplacementNamed(context, '/topics');
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(
                size: 150,
              ),
              Text('Login to Start'),
              LoginButton(
                text: 'Google Sign In',
                icon: FontAwesomeIcons.google,
                color: Colors.black45,
                loginMethod: () async {
                  var user = await auth.googleSignIn();
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/topics');
                  }
                  setState(() {});
                },
              ),
              FutureBuilder<Object>(
                  future: auth.appleSignInAvailable,
                  builder: (context, snapshot) {
                    if (snapshot.data == true) {
                      return AppleSignInButton(
                        onPressed: () async {
                          User user = await auth.appleSignIn();
                          if (user != null) {
                            Navigator.pushReplacementNamed(context, '/topics');
                          }
                        },
                      );
                    } else {
                      return Container();
                    }
                  }),
              LoginButton(
                text: 'Continue as Guest',
                loginMethod: () async {
                  var user = await auth.anonLogin();
                  if (user != null) {
                    Navigator.pushReplacementNamed(context, '/topics');
                  }
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginMethod;

  const LoginButton({this.text, this.icon, this.color, this.loginMethod});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton.icon(
          onPressed: loginMethod,
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          label: Text(text)),
    );
  }
}

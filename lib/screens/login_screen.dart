//Flutter
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    if (auth.user != null) {
      Navigator.pushReplacementNamed(context, '/topics');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(),
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
            LoginButton(
              text: 'Continue as Guest',
              loginMethod: () async {
                var user = await auth.anonLogin();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/topics');
                }
                setState(() {});
              },
            )
          ],
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

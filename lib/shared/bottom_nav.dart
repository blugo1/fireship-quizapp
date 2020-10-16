//Flutter
import 'package:flutter/material.dart';

//Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.graduationCap,
            size: 20,
          ),
          label: 'Topics',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.bolt,
            size: 20,
          ),
          label: 'About',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.userCircle,
            size: 20,
          ),
          label: 'Profile',
        ),
      ].toList(),
      fixedColor: Colors.deepPurple[200],
      onTap: (int idx) {
        switch (idx) {
          case 0:
            //Ignore
            break;
          case 1:
            //Navigate to about
            Navigator.pushNamed(context, '/about');
            break;
          case 2:
            //Navigate to profile
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}

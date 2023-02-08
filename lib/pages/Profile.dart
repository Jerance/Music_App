import 'package:flutter/material.dart';
import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'ProfilePage',
                style: mainTitle,
              )
            ]),
      ),
    );
  }
}

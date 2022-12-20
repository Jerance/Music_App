import 'package:flutter/material.dart';
import 'package:music_app/utils/translate.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(t(context)!.connection, style: paragraphTextStyle),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(t(context)!.back, style: paragraphTextStyle)),
          ],
        ),
      ),
    );
  }
}

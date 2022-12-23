import 'package:flutter/material.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/services/auth.dart';
import 'package:music_app/utils/translate.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class TrendPage extends StatelessWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColorDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(t(context)!.nomApplication, style: paragraphTextStyle),
            TextButton(
              style: btnSignUp,
              onPressed: logoutFirebase,
              child: Text("Deconnexion", style: p1),
            ),
          ],
        ),
      ),
    );
  }
}

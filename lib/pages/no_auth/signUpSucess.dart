import 'package:flutter/material.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/pages/no_auth/Login.dart';
import 'package:music_app/services/auth.dart';
import 'package:music_app/utils/translate.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class SignUpSuccessPage extends StatefulWidget {
  const SignUpSuccessPage({Key? key}) : super(key: key);

  @override
  _SignUpSuccessPageState createState() => _SignUpSuccessPageState();
}

class _SignUpSuccessPageState extends State<SignUpSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage())),
        style: btnSignUp,
        child: Text(t(context)!.connection, style: p1));
  }
}

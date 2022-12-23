import 'package:flutter/material.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/pages/trend_page.dart';
import 'package:music_app/services/auth.dart';
import 'package:music_app/utils/translate.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColorDark,
        toolbarHeight: 190,
        shadowColor: Colors.transparent,
        title: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.asset(
                  'lib/assets/img/logoMusicApp.png',
                  height: 75,
                  width: 75,
                ),
              ),
              Text(t(context)!.nomApplication, style: mainTitle),
            ],
          ),
        ),
      ),
      backgroundColor: mainColorDark,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(t(context)!.email_label, style: inputLabel)),
          ),
          Container(
            width: 355,
            height: 60,
            child: Center(
              child: TextField(
                controller: emailField,
                style: const TextStyle(color: lightGray, fontSize: 14),
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  filled: true,
                  fillColor: inputBg,
                  hintText: "exemple@gmail.com",
                  hintStyle: TextStyle(color: lightGray, fontSize: 14),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(t(context)!.email_label, style: inputLabel)),
          ),
          Container(
            width: 355,
            height: 60,
            child: Center(
              child: TextField(
                controller: passwordField,
                obscureText: passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                style: const TextStyle(color: lightGray, fontSize: 14),
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    filled: true,
                    fillColor: inputBg,
                    hintText: "azerty",
                    hintStyle: const TextStyle(color: lightGray, fontSize: 14),
                    suffixIcon: InkWell(
                      onTap: _toggleIconEye,
                      child: passwordVisible == true
                          ? const Icon(
                              Icons.visibility,
                              color: gold,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: gold,
                            ),
                    )),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                loginFirebase(
                    emailField.text.trim(), passwordField.text.trim());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrendPage()));
              },
              style: btnSignUp,
              child: Text(t(context)!.connection, style: p1)),
          const SizedBox(
            height: 60,
          ),
          Text("Ou", style: p1gold),
        ]),
      ),
    );
  }

  void _toggleIconEye() {
    if (passwordVisible == true) {
      passwordVisible = false;
    } else {
      passwordVisible = true;
    }
    setState(() {
      passwordVisible != passwordVisible;
    });
  }
}

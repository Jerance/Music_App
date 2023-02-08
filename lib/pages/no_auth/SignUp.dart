import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/pages/no_auth/SignUpStep2.dart';
import 'package:music_app/utils/translate.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailField = TextEditingController();
  final passwordField = TextEditingController();
  String _errorText = "";
  String _errorTextEmail = "";
  bool iconErrorVisible = false;
  SvgPicture iconError = SvgPicture.asset(
    'lib/assets/img/icons/circle-exclamation-solid.svg',
    height: 20,
  );
  String _errorTextPassword = "";
  bool passwordVisible = true;
  bool borderColorRed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColorDark,
        toolbarHeight: 150,
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
                textAlignVertical: TextAlignVertical
                    .center, // text qui va centrer au niveau du prefix Icon$

                controller: emailField,

                style: const TextStyle(color: lightGray, fontSize: 16),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                  enabledBorder: borderColorRed == false
                      ? const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        )
                      : const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: darkRed),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                  focusedBorder: borderColorRed == false
                      ? const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        )
                      : const OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: darkRed),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                  filled: true,
                  fillColor: inputBg,
                  hintText: "exemple@gmail.com",
                  hintStyle: const TextStyle(color: lightGray, fontSize: 16),
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: gold,
                  ),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: iconErrorVisible == true
                      ? Container(
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SvgPicture.asset(
                                    'lib/assets/img/icons/circle-exclamation-solid.svg',
                                    height: 20,
                                  )),
                              Text(
                                _errorTextEmail,
                                style: verifErrors,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          width: 0,
                        ))),

          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text("Mot de passe", style: inputLabel)),
          ),
          Container(
            width: 355,
            height: 60,
            child: Center(
              child: TextField(
                textAlignVertical: TextAlignVertical
                    .center, // text qui va centrer au niveau du prefix Icon
                controller: passwordField,
                obscureText: passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                style: const TextStyle(color: lightGray, fontSize: 16),
                decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 50.0),
                    enabledBorder: borderColorRed == false
                        ? const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          )
                        : const OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: darkRed),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                    focusedBorder: borderColorRed == false
                        ? const OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.transparent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          )
                        : const OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: darkRed),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                    filled: true,
                    fillColor: inputBg,
                    hintText: "azerty",
                    hintStyle: const TextStyle(color: lightGray, fontSize: 16),
                    prefixIcon: const Icon(Icons.key, color: gold),
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
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: iconErrorVisible == true
                      ? Container(
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SvgPicture.asset(
                                    'lib/assets/img/icons/circle-exclamation-solid.svg',
                                    height: 20,
                                  )),
                              Text(
                                _errorTextPassword,
                                style: verifErrors,
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          width: 0,
                        ))),
          const SizedBox(
            height: 20,
          ),
          // Vérification Errors
          TextButton(
              style: btnSignUp,
              onPressed: () {
                if (emailField.text == "" && passwordField.text == "") {
                  setState(() {
                    iconErrorVisible = true;
                    borderColorRed = true;
                    _errorTextEmail = "Email is required";
                    _errorTextPassword = "Password is required";
                  });
                }
                if (emailField.text == "") {
                  setState(() {
                    iconErrorVisible = true;
                    borderColorRed = true;
                    _errorTextEmail = "Email is required";
                  });
                } else if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(emailField.text) ==
                    false) {
                  setState(() {
                    borderColorRed = true;
                    _errorTextEmail = "Not a conform email regex";
                  });
                }
                if (passwordField.text == "") {
                  setState(() {
                    borderColorRed = true;
                    _errorTextPassword = "Password is required";
                  });
                } else if (passwordField.text.length <= 11) {
                  setState(() {
                    borderColorRed = true;
                    _errorTextPassword = "Password must be at least minimum 12";
                  });
                } else {
                  setState(() {
                    iconErrorVisible = false;
                    borderColorRed = false;
                    _errorText = "";
                    _errorTextEmail = "";
                    _errorTextPassword = "";
                  });
                }
                if (iconErrorVisible == false &&
                    _errorText == "" &&
                    _errorTextEmail == "" &&
                    _errorTextPassword == "" &&
                    borderColorRed == false) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpStep2Screen(
                            email: emailField.text,
                            password: passwordField.text)),
                  );
                }
              },
              child: Text(t(context)!.next, style: p1)),
          const SizedBox(
            height: 60,
          ),
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

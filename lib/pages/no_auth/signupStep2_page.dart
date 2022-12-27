import 'package:flutter/material.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/utils/translate.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpStep2Screen extends StatefulWidget {
  SignUpStep2Screen({super.key, required this.email, required this.password});

  String email;
  String password;

  @override
  _SignUpStep2PageState createState() => _SignUpStep2PageState();
}

class _SignUpStep2PageState extends State<SignUpStep2Screen> {
  File? _image;
  final picker = ImagePicker();

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
      body: Column(children: [
        CircleAvatar(
          maxRadius: 60,
          minRadius: 50,
          backgroundColor: lightGray,
          // backgroundImage: ,
          child: Column(
            children: [
              Container(
                child: _image == null
                    ? const Text('No image selected')
                    : Image.file(_image!),
              ),
              const SizedBox(
                height: 20,
              ),
              FloatingActionButton(
                  backgroundColor: gold,
                  onPressed: getImage,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: mainColorDark,
                  )),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(child: Text('Nom', style: inputLabel)),
                ),
                Container(
                  width: 160,
                  height: 60,
                  child: const Center(
                    child: TextField(
                      style: TextStyle(color: lightGray, fontSize: 16),
                      decoration: InputDecoration(
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
                        hintText: "Michael",
                        hintStyle: TextStyle(color: lightGray, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(child: Text('Prénom', style: inputLabel)),
                ),
                Container(
                  width: 160,
                  height: 60,
                  child: const Center(
                    child: TextField(
                      style: TextStyle(color: lightGray, fontSize: 16),
                      decoration: InputDecoration(
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
                        hintText: "Jerance",
                        hintStyle: TextStyle(color: lightGray, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text('Pseudo', style: inputLabel)),
          ),
          Container(
            width: 360,
            height: 60,
            child: const Center(
              child: TextField(
                style: TextStyle(color: lightGray, fontSize: 16),
                decoration: InputDecoration(
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
                  hintText: "Jerance93",
                  hintStyle: TextStyle(color: lightGray, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ]),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            style: btnSignUp,
            onPressed: () {},
            child: Text(t(context)!.register, style: p1)),
      ]),
    );
  }

  Future getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

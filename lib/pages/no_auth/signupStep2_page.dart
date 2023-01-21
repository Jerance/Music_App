import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:music_app/assets/theme/styles.dart';
import 'package:music_app/services/auth.dart';
import 'package:music_app/utils/translate.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:music_app/assets/font/font.dart';
import 'package:music_app/assets/theme/colors.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

FirebaseStorage storage = FirebaseStorage.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class SignUpStep2Screen extends StatefulWidget {
  SignUpStep2Screen({super.key, required this.email, required this.password});

  String email;
  String password;

  @override
  _SignUpStep2PageState createState() => _SignUpStep2PageState();
}

class _SignUpStep2PageState extends State<SignUpStep2Screen> {
  String _email = "";
  String _password = "";

  final lastNameField = TextEditingController();
  final firstNameField = TextEditingController();
  final pseudoField = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _password = widget.password;

    birthDateField.text = ""; //set the initial value of text field
    super.initState();
  }

  var image;
  final picker = ImagePicker();

  Future uploadFile() async {
    Reference storageRef = storage.ref('Users').child('test.png');
    UploadTask uploadTask = storageRef.putFile(image);
    await uploadTask.whenComplete(() => print("File uploaded successfully"));
  }

  final birthDateField = TextEditingController();

  bool checkedValue = false;
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
                child: image == null
                    ? const Text('No image selected')
                    : Image.file(image!),
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
        const SizedBox(
          height: 10,
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
                  child: Center(
                    child: TextField(
                      controller: lastNameField,
                      style: const TextStyle(color: lightGray, fontSize: 16),
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
                  child: Center(
                    child: TextField(
                      controller: firstNameField,
                      style: const TextStyle(color: lightGray, fontSize: 16),
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
            child: Center(
              child: TextField(
                controller: pseudoField,
                style: const TextStyle(color: lightGray, fontSize: 16),
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
                  hintText: "Jerance93",
                  hintStyle: TextStyle(color: lightGray, fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Text('Date de naissance', style: inputLabel)),
          ),
          Container(
            width: 360,
            height: 60,
            child: Center(
                child: TextField(
              style: const TextStyle(color: lightGray, fontSize: 16),
              textAlignVertical: TextAlignVertical
                  .center, // text qui va centrer au niveau du prefix Icon
              controller: birthDateField, //editing controller of this TextField
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
                hintText: "date de naissance",
                hintStyle: TextStyle(color: lightGray, fontSize: 16),
                prefixIcon: Icon(
                  Icons.calendar_month,
                  color: gold,
                ), //icon of text field
              ),
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: goldLight, // <-- SEE HERE
                          onPrimary: mainColorDark, // <-- SEE HERE
                          onSurface: mainColorDark, // <-- SEE HERE
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: Colors.red, // button text color
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('dd-MM-yyyy').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    birthDateField.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            )),
          ),
        ]),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Checkbox(
                fillColor: MaterialStateProperty.all(gold),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
              ),
              const Flexible(
                child: Text(
                  "J'ai lu et j'accepte les Conditions d'utilisation et la Politique de confidentialité",
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            style: btnSignUp,
            onPressed: () {
              //uploadFile();
              signUpFirebase(
                  _email,
                  _password,
                  lastNameField.text,
                  firstNameField.text,
                  pseudoField.text,
                  birthDateField.text,
                  context);
            },
            child: Text(t(context)!.register, style: p1)),
      ]),
    );
  }

  Future getImage() async {
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

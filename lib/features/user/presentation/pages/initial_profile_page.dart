import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_chat_phone_number/features/user/app/const/app_const.dart';
import 'package:flutter_chat_phone_number/features/user/app/global/widgets/profile_widget.dart';
import 'package:flutter_chat_phone_number/features/user/app/home/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class InitialProfilePage extends StatefulWidget {
  const InitialProfilePage({super.key});

  @override
  State<InitialProfilePage> createState() => _InitialProfilePageState();
}

class _InitialProfilePageState extends State<InitialProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  File? _image;
  Future selectedImage() async {
    try {
      final pickedFile =
          await ImagePicker.platform.getImage(source: ImageSource.gallery);
      setState(() {
        if (pickedFile != null) {
          _image = File(pickedFile!.path);
        } else {
          print("No image select");
        }
      });
    } catch (e) {
      toast("something went wrong $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Profile",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Name and image",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: selectedImage,
            // onTap: () {},
            child: Container(
              width: 70,
              height: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: profileWidget(image: _image),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1.5),
              ),
            ),
            child: TextField(
              style: TextStyle(fontSize: 18, color: Colors.black),
              controller: _usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20, top: 50),
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

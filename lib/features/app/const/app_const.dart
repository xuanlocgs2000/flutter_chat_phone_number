import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_chat_phone_number/features/user/app/theme/style.dart';
import 'package:flutter/material.dart';

void toast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

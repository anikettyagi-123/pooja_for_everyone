
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';





/////this toast message i have used to print error or ny message
class Utils{
  void toastMessage(String message){
    Fluttertoast.showToast(

        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }}
import 'package:flutter/material.dart';

Widget myAppbar(){
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Mak", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600
        )),
        Text("News", style: TextStyle(
            color: Colors.blueAccent, fontWeight: FontWeight.w600),)
      ],
    ),
  );
}
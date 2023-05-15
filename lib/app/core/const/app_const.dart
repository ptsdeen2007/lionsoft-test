import 'package:flutter/material.dart';

BoxDecoration backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/background.png"),
    fit: BoxFit.cover,
  ),
);

const textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white,),
);
import 'package:flutter/material.dart';
import 'package:lionsbot_task/app/data/model/PointsModel.dart';

BoxDecoration backgroundImage = BoxDecoration(
  image: DecorationImage(
    image: AssetImage("assets/background.png"),
    fit: BoxFit.cover,
  ),
);

const textFieldBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
  ),
);

List<PontsModel> pointsModels = [
  PontsModel("Successful Operation",
      "+10 Points. Sucessfully oprated the robots without any issues."),
  PontsModel("Cleaning Spree", "+50 Points for using the robot daily!"),
  PontsModel("Welcome Reward", "+20 Points to kickstart your journey with us."),
  PontsModel("Successful Operation",
      "+10 Points. Sucessfully oprated the robots without any issues."),
  PontsModel("Cleaning Spree", "+50 Points for using the robot daily!"),
  PontsModel("Welcome Reward", "+20 Points to kickstart your journey with us."),
  PontsModel("Successful Operation",
      "+10 Points. Sucessfully oprated the robots without any issues."),
  PontsModel("Cleaning Spree", "+50 Points for using the robot daily!"),
  PontsModel("Welcome Reward", "+20 Points to kickstart your journey with us."),
];

class AppColors{
 static Color blue=Color(0xff208fe0);
 static Color red=Color(0xffe74c4b);
 static Color sliderBlue=Color(0xff2474e9);

}
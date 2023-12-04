import 'package:flutter/material.dart';

import 'package:music_app/const/color.dart';

const bold = "bold";
const regular = "regular";

ourStyle({family = "regular",double? size = 14,color = whitecolor}){
  return  TextStyle(
    fontSize: size,
    color: color,
    fontFamily: family,
  );
}
import 'package:flutter/material.dart';

const Color colorPrimaryLight = Color(0xFF06113E);
const Color colorPrimaryDark = Color(0xFF0059d4);
const Color online = Color(0xFF4BCB1F);
const kPrimaryColor = Color(0xFF06113E);
const kSecondaryColor = Color(0xFFE7F3FF);
const lightWhiteColor = Color(0xFFFAFAFA);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);
const colorIcons = Color(0xFF959595);
const colorText = Color(0xFF080C2F);
const colorLoveReact = Color(0xFFF03738);
const colorHahaReact = Color(0xFFF3BB1C);
const textFieldFillColor = Color(0xFFE7F3FF);
const colorShadow = Color.fromRGBO(210, 210, 210, 0.23);
const colorShadow2 = Color.fromRGBO(213, 213, 213, 0.25);
const Color feedback = Color(0xFF2365A8);

class AppColors {
  //TODO: for Light Theme color
  static const Color primaryColorLight = Color(0xFF0059d4);
  static const Color hintTextColorLight = Color(0xff9E9E9E);
  static const Color imageBGColorLight = Color(0xffE2F0FF);
  static const Color whiteColorLight = Color(0xFFFFFFFF);
  static const Color unreadColorLight = Color(0xFF00ACFF);

  //TODO: for Dark Theme Color
  static const Color primaryColorDark = Color(0xff006bff);
  static const Color hintTextColorDark = Color(0xff9E9E9E);
  static const Color imageBGColorDark = Color(0xffE2F0FF);
  static const Color whiteColorDark = Color(0xFFFFFFFF);
  static const Color unreadColorDark = Color(0xFF00ACFF);
  static const Color textColor = Color(0xFFE6E6E6);
  static const Color textFieldColorDark = Color(0xFF333333);

  static const Color scaffold = Color(0xFFF0F2F5);
  static const LinearGradient createRoomGradient = LinearGradient(colors: [Color(0xFF496AE1), Color(0xFFCE48B1)]);
  static const Color textFont = Color(0xFF000000);
  static const Color timeColor = Color(0xFFFF8C31);

  static const Color homeBG = Color(0xffF0F0F0);
  static const Color redColor = Color(0xffFF0000);
  static const Color columbiaBlue = Color(0xff92C6FF);
  static const Color accentColor = Color(0xFFE6A537);
  static const Color sellerText = Color(0xff92C6FF);
  static const Color postLikeCommentContainer = Color(0xffDDEFFD);
  static const Color postLikeCountContainer = Color(0xff195FC7);
  static const Color black = Color(0xFF252525);
  static const Color iconBg = Color(0xffF9F9F9);
  static const Color grey = Color(0xFF909090);
  static const Color lowGreen = Color(0xffEFF6FE);
  static const Color lightGrey = Color(0xFFDADADA);
  static const Color yellow = Color(0xFFFFAA47);

  static const Color bodyTextColorOverride = Color(0xFF020202);

  static Map<String, Color> lightThemeColors = {
    "backgroundColor": const Color(0xFFf5f5f5),
    "fastButtonBackgroundColor": const Color(0xFFfe9585),
    "barColor": const Color(0xFFfe9585),
    "srcColor": const Color(0xFFfcfcfc),
    "iconColor": const Color(0xFFdedcd9),
    "textColor": const Color(0xFF000000),
    "srcButtonColor": const Color(0xFFff0000),
    "menuColor": const Color(0xFFf5f5f5),
    "buttonColor": const Color(0xFFfe9585),
    "qrColor": const Color(0xFFe82326),
  };

  static Map<String, dynamic> darkThemeColors = {
    "backgroundColor": const Color(0xFFf5f5f5),
    "fastButtonBackgroundColor": const Color(0xFFfe9585),
    "barColor": const Color(0xFFfe9585),
    "srcColor": const Color(0xFFfcfcfc),
    "iconColor": const Color(0xFFdedcd9),
    "textColor": const Color(0xFF000000),
    "srcButtonColor": const Color(0xFFff0000),
    "menuColor": const Color(0xFFf5f5f5),
    "buttonColor": const Color(0xFFfe9585),
    "qrColor": const Color(0xFFe82326),
  };

  static const LinearGradient defaultGradient = LinearGradient(colors: [primaryColorDark, Color(0xFFfe9585)]);

  static const Color facebookColor = Color(0xFF1976D2);

  static const Color appleColor = Color(0xFF000000);
}

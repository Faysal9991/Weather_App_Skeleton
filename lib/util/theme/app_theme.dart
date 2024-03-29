
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/util/theme/text.style.dart';

import 'app_colors.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme{


  static ThemeData getLightModeTheme(){

    return ThemeData(
      primaryColor: Colors.lightBlue,
   
      scaffoldBackgroundColor:AppColors.lightThemeColors['backgroundColor'],
      primaryColorDark: AppColors.primaryColorDark,
      cardColor: Colors.white,
      canvasColor: AppColors.lightThemeColors['backgroundColor'],
      shadowColor: AppColors.whiteColorLight,
      disabledColor: AppColors.grey,
      hintColor: AppColors.lightGrey,
      brightness: Brightness.light,
      bottomAppBarColor:  AppColors.lightThemeColors['backgroundColor'],
      dialogBackgroundColor:  AppColors.lightThemeColors['backgroundColor'],
      dividerColor: AppColors.lightThemeColors['backgroundColor'],
      cupertinoOverrideTheme: const CupertinoThemeData(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: const UnderlineInputBorder(),
        errorStyle: subtitle2.copyWith(color: Colors.red),
      ),
      textTheme:TextTheme(
        headline1: headline1.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline2: headline2.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline3: headline3.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline4: headline4.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline5: headline5.copyWith(color: AppColors.lightThemeColors['textColor']),
        headline6: headline6.copyWith(color: AppColors.lightThemeColors['textColor']),
        button: button.copyWith(color: AppColors.lightThemeColors['textColor']),
        caption: caption.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodyText1: bodyText1.copyWith(color: AppColors.lightThemeColors['textColor']),
        bodyText2: bodyText2.copyWith(color: AppColors.lightThemeColors['textColor']),
        subtitle1: input.copyWith(color: AppColors.lightThemeColors['textColor']),
        subtitle2: subtitle2.copyWith(color: AppColors.lightThemeColors['textColor']),
      ),

    );
  }

 
}
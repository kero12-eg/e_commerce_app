import 'package:e_commerce_app/Core/Styling/app_fonts.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightcolor => ThemeData(
        primaryColor: Appcolor.primaryColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: AppFonts.mainfont,
        textTheme: TextTheme(
          titleLarge: AppStyle.headlinestyle,
          titleMedium: AppStyle.subheadlinestyle,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Appcolor.primarybackgroundbutton,
          disabledColor: Appcolor.placeholder,
          textTheme: ButtonTextTheme.primary,
        ),
      );
}

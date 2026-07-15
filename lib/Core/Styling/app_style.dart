import 'package:e_commerce_app/Core/Styling/app_fonts.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static TextStyle get headlinestyle => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.mainfont,
    color: Appcolor.primaryColor
  );
  static TextStyle get subheadlinestyle => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainfont,
      color: Appcolor.secondaryColor
  );
  static TextStyle get labeltextfield => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.mainfont,
      color: Appcolor.primaryColor
  );
  static TextStyle get buttontextstyle => TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: AppFonts.mainfont,
      color: Appcolor.forgroundbuttoncolor
  );
    static TextStyle get placeholderstyle => TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      fontFamily: AppFonts.mainfont,
      color: Appcolor.placeholder
  );
}
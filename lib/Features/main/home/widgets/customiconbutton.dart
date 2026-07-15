import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customiconbutton extends StatelessWidget {
  const Customiconbutton({
    super.key,
    this.onpressed,
    this.icon,
    this.width,
    this.height,
    this.radus,
  });
  final VoidCallback? onpressed;
  final String? icon;
  final double? width;
  final double? height;
  final double? radus;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Image.asset(icon!),
      style: IconButton.styleFrom(
        backgroundColor: Appcolor.primarybackgroundbutton,
        fixedSize: Size(width ?? 20.25.w, height ?? 18.75.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radus ?? 10.r),
        ),
      ),
    );
  }
}

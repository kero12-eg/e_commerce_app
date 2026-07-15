import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Primarybutton extends StatelessWidget {
  const Primarybutton({
    super.key,
    required this.text,
    this.color,
    this.width,
    this.height,
    required this.onpressed,
    this.color2,
    this.fontsize,
    this.icon,
    this.iconAtEnd = false,
  });
  final String text;
  final Color? color;
  final Color? color2;
  final double? width;
  final double? height;
  final void Function() onpressed;
  final double? fontsize;
  final String? icon;
  final bool iconAtEnd;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Appcolor.primarybackgroundbutton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fixedSize: Size(width ?? 325.w, height ?? 50.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && !iconAtEnd) ...[
            Image.asset(icon!),
            SizedBox(width: 8.w),
          ],
          Text(
            text,
            style: TextStyle(
              color: color2 ?? Appcolor.forgroundbuttoncolor,
              fontSize: fontsize ?? 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (icon != null && iconAtEnd) ...[
            SizedBox(width: 8.w),
            Image.asset(icon!),
          ],
        ],
      ),
    );
  }
}

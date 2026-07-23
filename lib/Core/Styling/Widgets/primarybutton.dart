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
  final VoidCallback onpressed;
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
        minimumSize: Size(width ?? 0, height ?? 50.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null && !iconAtEnd) ...[
            Image.asset(icon!, width: 18.w, height: 18.h),
            SizedBox(width: 8.w),
          ],

          Flexible(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color2 ?? Appcolor.forgroundbuttoncolor,
                fontSize: fontsize ?? 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          if (icon != null && iconAtEnd) ...[
            SizedBox(width: 8.w),
            Image.asset(icon!, width: 18.w, height: 18.h),
          ],
        ],
      ),
    );
  }
}

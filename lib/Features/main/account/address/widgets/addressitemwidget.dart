import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addressitemwidget extends StatelessWidget {
  const Addressitemwidget({
    super.key,
    this.addresstitle,
    this.addressdescription,
    this.imageurl,
  });
  final String? addresstitle;
  final String? addressdescription;
  final String? imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 341.w,
      height: 76.h,
      decoration: BoxDecoration(
        color: Color(0xffE6E6E6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 39.w),
        child: Row(
          children: [
            Image.asset(
              imageurl ?? AppAssets.location,
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  addresstitle ?? "Home",
                  style: AppStyle.headlinestyle.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 4.h),
                Text(
                  addressdescription ?? "925 S Chugach St #APT 10, Alas...",
                  style: AppStyle.subheadlinestyle.copyWith(fontSize: 12.sp),
                  overflow: TextOverflow.ellipsis,
                  textAlign: .center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

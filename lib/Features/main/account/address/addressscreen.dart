import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/main/account/address/widgets/addressitemwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Addressscreen extends StatelessWidget {
  const Addressscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("Saved Address", style: AppStyle.labeltextfield),
            SizedBox(height: 14.h),
            Addressitemwidget(),
            SizedBox(height: 12.h),
            Addressitemwidget(
              addresstitle: "Office",
              addressdescription: "2438 6th Ave, Ketchikan, Alaska...",
            ),
            SizedBox(height: 12.h),
            Addressitemwidget(
              addresstitle: "Apartment",
              addressdescription: "2551 Vista Dr #B301, Juneau, AI...",
            ),
            SizedBox(height: 12.h),
            Addressitemwidget(
              addresstitle: "Parent’s House",
              addressdescription: "4821 Ridge Top Cir, Anchorage,...",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:e_commerce_app/Core/utils/service_locator.dart';
import 'package:e_commerce_app/Core/utils/storage_helper.dart';
import 'package:e_commerce_app/Features/main/account/Widgets/accountitemwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Accountscreen extends StatelessWidget {
  const Accountscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Accountitemwidget(
              title: "My Orders",
              leadingicon: AppAssets.orders,
              trailingicon: Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 25.h),
            Divider(color: Color(0xffAAAAAA), thickness: 10),
            SizedBox(height: 25.h),
            Accountitemwidget(
              title: "My Details",
              leadingicon: AppAssets.details,
              trailingicon: Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Divider(color: Color(0xffE6E6E6)),
            ),
            InkWell(
              onTap: () {
                context.pushNamed(AppRouter.address);
              },
              child: Accountitemwidget(
                title: "Address Book",
                leadingicon: AppAssets.address,
                trailingicon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Divider(color: Color(0xffE6E6E6)),
            ),
            Accountitemwidget(
              title: "FAQs",
              leadingicon: AppAssets.fqa,
              trailingicon: Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Divider(color: Color(0xffE6E6E6)),
            ),
            Accountitemwidget(
              title: "Help Center",
              leadingicon: AppAssets.helpcenter,
              trailingicon: Icons.arrow_forward_ios_outlined,
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Divider(color: Color(0xffE6E6E6)),
            ),
            SizedBox(height: 25.h),
            Divider(color: Color(0xffE6E6E6), thickness: 10),
            SizedBox(height: 175.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                      title: Column(
                        crossAxisAlignment: .center,
                        children: [
                          Image.asset(
                            AppAssets.warning,
                            width: 78.w,
                            height: 78.h,
                          ),
                          Text(
                            "Logout?",
                            style: AppStyle.headlinestyle.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      content: Text(
                        "Are you sure you want to logout?",
                        textAlign: TextAlign.center,
                        style: AppStyle.subheadlinestyle,
                      ),
                      actions: [
                        Primarybutton(
                          onpressed: () async {
                            await sl<StorageHelper>().deleteToken();
                            context.goNamed(AppRouter.login);
                          },
                          text: "Yes, Logout",
                          color: Appcolor.secondarybackgroundbutton,
                        ),
                        Primarybutton(
                          onpressed: () {
                            context.pop();
                          },
                          text: "No, Cancel",
                          color: Appcolor.forgroundbuttoncolor,
                          color2: Appcolor.primaryColor,
                        ),
                      ],
                                          );
                    },
                  );
                },
                child: Row(
                  children: [
                    Image.asset(AppAssets.logout, width: 24.w, height: 24.h),
                    SizedBox(width: 16.w),
                    Text(
                      "Logout",
                      style: AppStyle.subheadlinestyle.copyWith(
                        color: Appcolor.secondarybackgroundbutton,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 75.h),
          ],
        ),
      ),
    );
  }
}

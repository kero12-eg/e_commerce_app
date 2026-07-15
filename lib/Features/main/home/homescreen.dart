import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:e_commerce_app/Features/main/home/widgets/custom_grid_view.dart';
import 'package:e_commerce_app/Features/main/home/widgets/customiconbutton.dart';
import 'package:e_commerce_app/Features/main/home/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  final data = [
    Data(
      image: AppAssets.product1,
      name: "Shoes",
      price: "1,190",
      rate: "4.0/5 (45 reviews)",
      description:
          "Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt . Good for All Men and Suits for All of Them",
    ),
    Data(
      image: AppAssets.product2,
      name: "Fit Polo T Shirt",
      price: "1,100",
      rate: "4.0/5 (45 reviews)",
      description:
          "Blue T Shirt . Good for All Men and Suits for All of Them.Blue T Shirt . Good for All Men and Suits for All of Them",
    ),
    Data(
      image: AppAssets.product2,
      name: "Regular Fit Black",
      price: "1,690",
      rate: "4.0/5 (45 reviews)",
      description: "Blue T Shirt . Good for All Men and Suits for All of Them",
    ),
    Data(
      image: AppAssets.product1,
      name: "Regular Fit V-Neck",
      price: "1,290",
      rate: "4.0/5 (45 reviews)",
      description:
          "Blue T Shirt . Good for All Men and Suits for All of ThemBlue T Shirt .",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 59.h),
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Discover", style: AppStyle.headlinestyle),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Customtextfield(
                    hinttext: "Search for clothes...",
                    width: 281.w,
                    height: 52.h,
                    prefixicon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Customiconbutton(icon: AppAssets.filter, onpressed: () {}),
                ],
              ),
              SizedBox(height: 16.w),
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Primarybutton(
                    text: "All",
                    onpressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    color: _selectedIndex == 0
                        ? Appcolor.primarybackgroundbutton
                        : Color(0xffE6E6E6),
                    color2: _selectedIndex == 0
                        ? Appcolor.forgroundbuttoncolor
                        : Appcolor.primaryColor,
                    width: 60.w,
                    fontsize: 13.sp,
                    height: 36.h,
                  ),
                  SizedBox(width: 8.w),
                  Primarybutton(
                    text: "Tshirts",
                    onpressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    color: _selectedIndex == 1
                        ? Appcolor.primarybackgroundbutton
                        : Color(0xffE6E6E6),
                    color2: _selectedIndex == 1
                        ? Appcolor.forgroundbuttoncolor
                        : Appcolor.primaryColor,
                    width: 92.w,
                    fontsize: 12.sp,
                    height: 36.h,
                  ),
                  SizedBox(width: 8.w),
                  Primarybutton(
                    text: "Jeans",
                    onpressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    color: _selectedIndex == 2
                        ? Appcolor.primarybackgroundbutton
                        : Color(0xffE6E6E6),
                    color2: _selectedIndex == 2
                        ? Appcolor.forgroundbuttoncolor
                        : Appcolor.primaryColor,
                    width: 86.w,
                    fontsize: 11.sp,
                    height: 36.h,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Primarybutton(
                      text: "Shoes",
                      onpressed: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                      },
                      color: _selectedIndex == 3
                          ? Appcolor.primarybackgroundbutton
                          : Color(0xffE6E6E6),
                      color2: _selectedIndex == 3
                          ? Appcolor.forgroundbuttoncolor
                          : Appcolor.primaryColor,
                      width: 87.w,
                      fontsize: 15.sp,
                      height: 36.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Customgridview(
                data: data,
                onTap: (index) {
                  context.pushNamed(AppRouter.details, extra: data[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

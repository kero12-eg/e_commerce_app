import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/main/cart/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(AppRouter.home);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              CartItemWidget(),
              SizedBox(height: 14.h),
              CartItemWidget(
                imageurl: AppAssets.product1,
                title: "Regular Fit Polo",
                size: "Size M",
                price: "1,100",
              ),
              SizedBox(height: 50.h),
              ListTile(
                leading: Text("Sub-total", style: AppStyle.subheadlinestyle),
                trailing: Text("\$ 5,870", style: AppStyle.labeltextfield),
              ),
              SizedBox(height: 16.h),
              ListTile(
                leading: Text("VAT (%)", style: AppStyle.subheadlinestyle),
                trailing: Text("\$ 0.00", style: AppStyle.labeltextfield),
              ),
              SizedBox(height: 16.h),
              ListTile(
                leading: Text("Shipping", style: AppStyle.subheadlinestyle),
                trailing: Text("\$ 80", style: AppStyle.labeltextfield),
              ),
              SizedBox(height: 16.h),
              Divider(),
              SizedBox(height: 16.h),
              ListTile(
                leading: Text("Total", style: AppStyle.labeltextfield),
                trailing: Text("\$ 5,950", style: AppStyle.labeltextfield),
              ),
              SizedBox(height: 16.h),
              Primarybutton(
                text: "Go To Checkout",
                onpressed: () {},
                icon: AppAssets.checkout,
                iconAtEnd: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

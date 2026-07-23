import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/utils/animated_snack_bar.dart';
import 'package:e_commerce_app/Features/main/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/main/cart/model/cart_model.dart';
import 'package:e_commerce_app/Features/main/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Detailsscreen extends StatelessWidget {
  const Detailsscreen({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "Details",
          style: AppStyle.headlinestyle.copyWith(fontSize: 24.sp),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 341.w,
                    height: 369.h,
                    child: Image.network(
                      product.images!.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  Text(
                    product.title!,
                    style: AppStyle.headlinestyle.copyWith(fontSize: 24.sp),
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    children: [
                      Image.asset(AppAssets.star, width: 16.w, height: 16.h),
                      SizedBox(width: 5.w),
                      Text("4.5", style: AppStyle.labeltextfield),
                    ],
                  ),

                  SizedBox(height: 13.h),

                  Text(product.description!, style: AppStyle.subheadlinestyle),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),

          SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price", style: AppStyle.subheadlinestyle),
                          Text(
                            product.price.toString(),
                            style: AppStyle.labeltextfield,
                          ),
                        ],
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Primarybutton(
                          text: "Add to Cart",
                          icon: AppAssets.bag,
                          onpressed: () {
                            context.read<CartCubit>().addToCart(
                              CartModel(
                                id: product.id!,
                                title: product.title!,
                                price: product.price!.toDouble(),
                                image: product.images!.first,
                              ),
                            );
                            showanimatedsnackdialog(
                              context,
                              message: "Product added to cart",
                              type: AnimatedSnackBarType.success,
                            );
                          },
                          height: 54.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

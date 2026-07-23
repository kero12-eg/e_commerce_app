import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/loading_widget.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:e_commerce_app/Features/main/home/cubit/category_cubit.dart';
import 'package:e_commerce_app/Features/main/home/cubit/category_state.dart';
import 'package:e_commerce_app/Features/main/home/cubit/product_cubit.dart';
import 'package:e_commerce_app/Features/main/home/cubit/product_state.dart';
import 'package:e_commerce_app/Features/main/home/models/product_model.dart';
import 'package:e_commerce_app/Features/main/home/widgets/custom_grid_view.dart';
import 'package:e_commerce_app/Features/main/home/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  TextEditingController searchcontroller = TextEditingController();
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
  void initState() {
    super.initState();
    searchcontroller = TextEditingController();
    context.read<CategoryCubit>().getCategories();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 59.h),
      child: RefreshIndicator(
        color: Appcolor.primarybackgroundbutton,
        backgroundColor: Colors.white,
        onRefresh: () async {
          _selectedIndex = 0;
          searchcontroller.clear();
          setState(() {});
          context.read<ProductCubit>().getProducts();
        },
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
                    onChanged: (value) {
                      context.read<ProductCubit>().getproductsearchbyname(value);
                    },
                    controller: searchcontroller,
                    prefixicon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoaded) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: .spaceEvenly,

                        children: state.categories.map((e) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Primarybutton(
                              text: e.name!,
                              onpressed: () {
                                searchcontroller.clear();
                                setState(() {
                                  _selectedIndex = state.categories.indexOf(e);
                                  if (e.name == "All") {
                                    context.read<ProductCubit>().getProducts();
                                  } else {
                                    context
                                        .read<ProductCubit>()
                                        .getproductcategory(e.id!);
                                  }
                                });
                              },
                              color:
                                  _selectedIndex == state.categories.indexOf(e)
                                  ? Appcolor.primarybackgroundbutton
                                  : Color(0xffE6E6E6),
                              color2:
                                  _selectedIndex == state.categories.indexOf(e)
                                  ? Appcolor.forgroundbuttoncolor
                                  : Appcolor.primaryColor,
                              width: 86.w,
                              fontsize: 11.sp,
                              height: 36.h,
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                  if (state is CategoryError) {
                    return Center(child: Text("There is an error"));
                  }
                  return const Center(child: LoadingWidget());
                },
              ),
              SizedBox(height: 24.h),
              BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoaded) {
                    List<ProductModel> products = state.products;
                    return Customgridview(
                      products: products,
                      onTap: (index) {
                        context.pushNamed(
                          AppRouter.details,
                          extra: products[index],
                        );
                      },
                    );
                  }
                  if (state is ProductError) {
                    return Center(child: Text("There is an error"));
                  }
                  return const Center(child: LoadingWidget());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

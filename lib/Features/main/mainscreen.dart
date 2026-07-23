import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:e_commerce_app/Core/utils/service_locator.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/main/account/accountscreen.dart';
import 'package:e_commerce_app/Features/main/cart/cartscreen.dart';
import 'package:e_commerce_app/Features/main/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/main/home/cubit/category_cubit.dart';
import 'package:e_commerce_app/Features/main/home/cubit/product_cubit.dart';
import 'package:e_commerce_app/Features/main/home/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int index = 0;
  List<Widget> screens = [
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => sl<CategoryCubit>(),
      ),
      BlocProvider(
        create: (_) => sl<ProductCubit>(),
      ),
      BlocProvider(
        create: (_) => sl<CartCubit>(),
      ),
    ],
    child: Homescreen(),
  ),
  BlocProvider(
    create: (context) => sl<CartCubit>(),
    child: Cartscreen()),
  BlocProvider(
    create: (context) => sl<AuthCubit>(),
    child: Accountscreen()),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Appcolor.primaryColor,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppAssets.account),
            label: 'Account',
          ),
        ],
      ),
      body: screens[index],
    );
  }
}

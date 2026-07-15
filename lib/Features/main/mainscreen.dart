import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/appcolor.dart';
import 'package:e_commerce_app/Features/main/account/accountscreen.dart';
import 'package:e_commerce_app/Features/main/cart/cartscreen.dart';
import 'package:e_commerce_app/Features/main/home/homescreen.dart';
import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int index = 0;
  List<Widget> screens = [Homescreen(), Cartscreen(), Accountscreen()];
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

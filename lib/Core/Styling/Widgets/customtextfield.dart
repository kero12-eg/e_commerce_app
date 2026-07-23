import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    required this.hinttext,
    this.obscuretext,
    this.suffixicon,
    this.controller, this.prefixicon, this.width, this.height, this.onChanged,
  });
  final String hinttext;
  final bool? obscuretext;
  final IconButton? suffixicon;
  final TextEditingController? controller;
  final Icon? prefixicon;
  final double? width;
  final double? height;
final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 341.w,
      height: height ?? 52.h,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        obscureText: obscuretext ?? false,
        autofocus: true,
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0, fontSize: 0),
          errorMaxLines: 1,
          hintText: hinttext,
          hintStyle: AppStyle.placeholderstyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          suffixIcon: suffixicon,
          prefixIcon: prefixicon,
        ),
      ),
    );
  }
}

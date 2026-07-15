import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Accountitemwidget extends StatelessWidget {
  const Accountitemwidget({
    super.key,
    this.title,
    this.leadingicon,
    this.trailingicon,
  });
  final String? title;
  final String? leadingicon;
  final IconData? trailingicon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(leadingicon!, width: 24.w, height: 24.h),
      title: Text(title!),
      trailing: Icon(trailingicon, size: 24.sp, color: Color(0xffB3B3B3)),
    );
  }
}

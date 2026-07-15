import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/main/home/widgets/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customgridview extends StatelessWidget {
  const Customgridview({super.key, required this.data, this.onTap});

  final List<Data> data;
  final void Function(int index)? onTap;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 161.w,
              height: 166.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: InkWell(
                  onTap: () => onTap?.call(index),
                  child: Image.asset(data[index].image!, fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(data[index].name!, style: AppStyle.labeltextfield),
            SizedBox(height: 3.h),
            Text(
              "\$ ${data[index].price!}",
              style: AppStyle.subheadlinestyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        );
      },
    );
  }
}

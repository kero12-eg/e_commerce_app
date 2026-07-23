import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/main/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customgridview extends StatelessWidget {
  const Customgridview({
    super.key,
    required this.products,
    this.onTap,
  });

  final List<ProductModel> products;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final product = products[index];

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
                  child: Image.network(
                    product.images != null && product.images!.isNotEmpty
                        ? product.images!.first
                        : "https://via.placeholder.com/150",
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              product.title ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.labeltextfield,
            ),
            SizedBox(height: 3.h),
            Text(
              "\$ ${product.price ?? 0}",
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
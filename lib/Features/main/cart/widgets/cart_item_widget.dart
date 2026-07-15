import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatefulWidget {
  const CartItemWidget({
    super.key,
    this.imageurl,
    this.title,
    this.size,
    this.price,
  });
  final String? imageurl;
  final String? title;
  final String? size;
  final String? price;
  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 80.w,
            height: 80.h,
            child: Image.asset(
              widget.imageurl ?? AppAssets.product2,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.title ?? "Regular Fit Slogan",
                        style: AppStyle.labeltextfield,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        AppAssets.delete,
                        width: 22.w,
                        height: 22.h,
                      ),
                    ),
                  ],
                ),

                Text(widget.size ?? "Size L", style: AppStyle.placeholderstyle),

                const Spacer(),

                Row(
                  children: [
                    Text(
                      "\$ ${widget.price ?? "1,190"}",
                      style: AppStyle.labeltextfield,
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: decrement,
                      icon: const Icon(Icons.remove),
                    ),

                    Text("$count", style: AppStyle.labeltextfield),

                    IconButton(
                      onPressed: increment,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

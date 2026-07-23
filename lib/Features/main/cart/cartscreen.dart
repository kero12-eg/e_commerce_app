import 'package:e_commerce_app/Core/Styling/Widgets/loading_widget.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_assets.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/main/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/Features/main/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/Features/main/cart/model/cart_model.dart';
import 'package:e_commerce_app/Features/main/cart/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: LoadingWidget());
                  }
                  if (state is CartLoaded) {
                    List<CartModel> carts = state.carts;
                    if (carts.isEmpty) {
                      return const Center(child: Text("Cart is Empty"));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          title: carts[index].title,
                          price: carts[index].price.toString(),
                          imageurl: carts[index].image,
                          size: "Size L",
                          quantity: carts[index].quantity,
                          onRemove: () {
                            final cartCubit = context.read<CartCubit>();

                            showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return AlertDialog(
                                  title: const Text("Remove Item"),
                                  content: const Text("Are you sure?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(dialogContext),
                                      child: const Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        await cartCubit.removeFromCart(
                                          carts[index].id,
                                        );
                                        Navigator.pop(dialogContext);
                                      },
                                      child: const Text("Yes"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onAdd: () {
                            context.read<CartCubit>().updateQuantity(
                              carts[index].id,
                              carts[index].quantity + 1,
                            );
                          },
                          onMinus: () {
                            if (carts[index].quantity > 1) {
                              context.read<CartCubit>().updateQuantity(
                                carts[index].id,
                                carts[index].quantity - 1,
                              );
                            }
                          },
                        );
                      },
                    );
                  }
                  return const Text("Something went wrong");
                },
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

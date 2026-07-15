import 'dart:developer';

import 'package:dartz/dartz.dart' as either;
import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/loading_widget.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Features/Auth/model/login_response_model.dart';
import 'package:e_commerce_app/Features/Auth/repo/auth_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool ispasswordvisible = true;
  bool isloading = false;
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    AuthRepo().login("john@mail.com", "changeme").then((
      either.Either<String, LoginResponseModel> res,
    ) {
      res.fold(
        (error) {
          log(error.toString());
        },
        (right) {
          log(right.toJson().toString());
        },
      );
    });
    return Scaffold(
      body: isloading
          ? LoadingWidget()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 59.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to your account",
                      style: AppStyle.headlinestyle,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "It’s great to see you again.",
                      style: AppStyle.subheadlinestyle,
                    ),
                    SizedBox(height: 24.h),

                    Text("User Name", style: AppStyle.labeltextfield),
                    SizedBox(height: 4.h),

                    Customtextfield(
                      hinttext: "Enter your email address",
                      controller: usernamecontroller,
                    ),

                    SizedBox(height: 16.h),

                    Text("Password", style: AppStyle.labeltextfield),
                    SizedBox(height: 4.h),

                    Customtextfield(
                      hinttext: "Enter your password",
                      controller: passwordcontroller,
                      obscuretext: ispasswordvisible,
                      suffixicon: IconButton(
                        icon: Icon(
                          ispasswordvisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            ispasswordvisible = !ispasswordvisible;
                          });
                        },
                      ),
                    ),

                    SizedBox(height: 55.h),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Primarybutton(
                        text: "Sign in",
                        onpressed: () {
                          if (!usernamecontroller.text.trim().endsWith(
                                "@gmail.com",
                              ) ||
                              usernamecontroller.text.contains(' ')) {
                            showSnackBar(
                              "Please enter a valid email",
                              Colors.red,
                            );
                            return;
                          }
                          if (passwordcontroller.text.trim().isEmpty) {
                            showSnackBar("Password is required", Colors.red);
                            return;
                          }

                          if (passwordcontroller.text !=
                              passwordcontroller.text.trim()) {
                            showSnackBar(
                              "Password must not start or end with spaces",
                              Colors.red,
                            );
                            return;
                          }

                          if (passwordcontroller.text.length < 8) {
                            showSnackBar(
                              "Password must be at least 8 characters",
                              Colors.red,
                            );
                            return;
                          }

                          if (!RegExp(
                            r'[A-Z]',
                          ).hasMatch(passwordcontroller.text)) {
                            showSnackBar(
                              "Password must contain at least one uppercase letter",
                              Colors.red,
                            );
                            return;
                          }

                          if (!RegExp(
                            r'[a-z]',
                          ).hasMatch(passwordcontroller.text)) {
                            showSnackBar(
                              "Password must contain at least one lowercase letter",
                              Colors.red,
                            );
                            return;
                          }

                          if (!RegExp(
                            r'[0-9]',
                          ).hasMatch(passwordcontroller.text)) {
                            showSnackBar(
                              "Password must contain at least one number",
                              Colors.red,
                            );
                            return;
                          } else {
                            context.pushNamed(AppRouter.home);
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 363.h),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Don’t have an account? ",
                              style: AppStyle.subheadlinestyle,
                            ),
                            TextSpan(
                              text: "Join",
                              style: AppStyle.labeltextfield,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(AppRouter.register);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

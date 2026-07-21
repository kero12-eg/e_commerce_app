import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/loading_widget.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/utils/animated_snack_bar.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Registerscreen extends StatefulWidget {
  const Registerscreen({super.key});

  @override
  State<Registerscreen> createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    fullnamecontroller = TextEditingController();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    confirmpasswordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    fullnamecontroller.dispose();
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    confirmpasswordcontroller.dispose();
    super.dispose();
  }

  void showSnackBar(String message, Color color) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            showanimatedsnackdialog(
              context,
              message: state.message,
              type: AnimatedSnackBarType.error,
            );
          } else if (state is AuthSuccess) {
            showanimatedsnackdialog(
              context,
              message: state.message,
              type: AnimatedSnackBarType.success,
            );
            context.pushReplacementNamed(AppRouter.home);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const LoadingWidget();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 59.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Create an account", style: AppStyle.headlinestyle),
                  SizedBox(height: 8.h),
                  Text(
                    "Let’s create your account.",
                    style: AppStyle.subheadlinestyle,
                  ),
                  SizedBox(height: 24.h),

                  Text("Full Name", style: AppStyle.labeltextfield),
                  SizedBox(height: 4.h),
                  Customtextfield(
                    hinttext: "Enter your full name",
                    controller: fullnamecontroller,
                  ),

                  SizedBox(height: 16.h),

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
                    obscuretext: obscureText,
                    suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),

                  SizedBox(height: 16.h),

                  Text("Confirm Password", style: AppStyle.labeltextfield),
                  SizedBox(height: 4.h),
                  Customtextfield(
                    hinttext: "Enter your password",
                    controller: confirmpasswordcontroller,
                    obscuretext: obscureText,
                    suffixicon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  SizedBox(height: 42.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Primarybutton(
                      text: "Create Account",
                      onpressed: () {
                        // Full Name
                        if (fullnamecontroller.text.trim().isEmpty) {
                          showSnackBar("Full name is required", Colors.red);
                          return;
                        }

                        if (fullnamecontroller.text !=
                            fullnamecontroller.text.trim()) {
                          showSnackBar(
                            "Full name must not start or end with spaces",
                            Colors.red,
                          );
                          return;
                        }

                        if (fullnamecontroller.text.trim().length < 3) {
                          showSnackBar(
                            "Full name must be at least 3 characters",
                            Colors.red,
                          );
                          return;
                        }

                        if (!RegExp(
                          r'^[a-zA-Z\s]+$',
                        ).hasMatch(fullnamecontroller.text.trim())) {
                          showSnackBar(
                            "Full name must contain letters only",
                            Colors.red,
                          );
                          return;
                        } else if (!usernamecontroller.text.trim().endsWith(
                              "@gmail.com",
                            ) ||
                            usernamecontroller.text.contains(' ')) {
                          showSnackBar(
                            "Please enter your email address",
                            Colors.red,
                          );
                        }
                        // Password
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
                        } else if (confirmpasswordcontroller.text !=
                            passwordcontroller.text) {
                          showSnackBar("Passwords do not match", Colors.red);
                        } else {
                          context.read<AuthCubit>().register(
                            name: fullnamecontroller.text.trim(),
                            email: usernamecontroller.text.trim(),
                            password: passwordcontroller.text.trim(),
                            "https://example.com/avatar.jpg"
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 162.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: AppStyle.subheadlinestyle,
                          ),
                          TextSpan(
                            text: "Log In",
                            style: AppStyle.labeltextfield,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(AppRouter.login);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

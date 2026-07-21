import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/loading_widget.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:e_commerce_app/Core/utils/animated_snack_bar.dart';
import 'package:e_commerce_app/Core/utils/service_locator.dart';
import 'package:e_commerce_app/Core/utils/storage_helper.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/Features/Auth/cubit/auth_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void validateLogin() {
    final email = usernamecontroller.text.trim();
    final password = passwordcontroller.text;

    if (email.isEmpty) {
      showSnackBar("Email is required", Colors.red);
      return;
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(email)) {
      showSnackBar("Please enter a valid email", Colors.red);
      return;
    }

    if (password.isEmpty) {
      showSnackBar("Password is required", Colors.red);
      return;
    }

    if (password.length < 8) {
      showSnackBar("Password must be at least 8 characters", Colors.red);
      return;
    }

    context.read<AuthCubit>().login(email: email, password: password);
  }

  @override
  void initState() {
    super.initState();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
    checkLogin();
  }
  Future<void> checkLogin() async {
  final accessToken = await sl<StorageHelper>().getAccessToken();
  final refreshToken = await sl<StorageHelper>().getRefreshToken();

  if (accessToken != null &&
      accessToken.isNotEmpty &&
      refreshToken != null &&
      refreshToken.isNotEmpty) {
    context.pushReplacementNamed(AppRouter.home);
  }
}

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

        builder: (BuildContext context, AuthState state) {
          if (state is AuthLoading) {
            return const LoadingWidget();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 59.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login to your account", style: AppStyle.headlinestyle),
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
                        validateLogin();
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
          );
        },
      ),
    );
  }
}

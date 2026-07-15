import 'package:e_commerce_app/Core/Routing/app_router.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/customtextfield.dart';
import 'package:e_commerce_app/Core/Styling/Widgets/primarybutton.dart';
import 'package:e_commerce_app/Core/Styling/app_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
      body: Padding(
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
                      showSnackBar("Please enter your email address", Colors.red);
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
          
                    if (!RegExp(r'[A-Z]').hasMatch(passwordcontroller.text)) {
                      showSnackBar(
                        "Password must contain at least one uppercase letter",
                        Colors.red,
                      );
                      return;
                    }
          
                    if (!RegExp(r'[a-z]').hasMatch(passwordcontroller.text)) {
                      showSnackBar(
                        "Password must contain at least one lowercase letter",
                        Colors.red,
                      );
                      return;
                    }
          
                    if (!RegExp(r'[0-9]').hasMatch(passwordcontroller.text)) {
                      showSnackBar(
                        "Password must contain at least one number",
                        Colors.red,
                      );
                      return;
                    } else if (confirmpasswordcontroller.text !=
                        passwordcontroller.text) {
                      showSnackBar("Passwords do not match", Colors.red);
                    } else {
                      context.pushNamed(AppRouter.home);
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
      ),
    );
  }
}

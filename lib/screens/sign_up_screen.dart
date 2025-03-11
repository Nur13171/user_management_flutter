// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, avoid_types_as_parameter_names, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_management/controllers/user_controller.dart';
import 'package:user_management/models/user_model.dart';

import 'package:user_management/utils/constants/color.dart';

import 'package:user_management/screens/loging_screen.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool status = false;
  final _formKey = GlobalKey<FormState>();

  bool passwordStatus = true; // To toggle password visibility
  bool confirmPasswordStatus = true; // To toggle confirm password visibility

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  void _register() async {
    // if (_formKey.currentState?.validate() ?? false) {
    //   setState(() {
    //     isLoading = true;
    //   });

    //   // Create user object
    //   UserModel newUser = UserModel(
    //     username: usernameController.text,
    //     email: emailController.text,
    //     password: passwordController.text,
    //   );

    //   // Call API
    //   var response = await UserController.register(newUser);

    //   setState(() {
    //     isLoading = false;
    //   });

    //   if (response["success"]) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("Registration Successful!")),
    //     );

    //     // Navigate to Login Screen
    //     //Navigator.pushReplacementNamed(context, "/login");
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text("Error: ${response["error"]}")),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 300.w,
                    height: 245.h,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 375.w,
                    padding: EdgeInsets.only(left: 30.w),
                    child: CustomText(
                      title: "Sign Up",
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.blackColor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Enter your credential to continue",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    textColor: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Username",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0.5.h)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5.h, color: Colors.grey)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your username";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Email",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0.5.h)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.5.h, color: Colors.grey)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Password",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    controller: passwordController, // Add controller here
                    obscureText: status,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5.h),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5.h, color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            status = !status;
                          });
                        },
                        icon: Icon(
                          status ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Confirm Password",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    controller:
                        confirmPasswordController, // Add controller here
                    obscureText: confirmPasswordStatus,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0.5.h),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5.h, color: Colors.grey),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmPasswordStatus = !confirmPasswordStatus;
                          });
                        },
                        icon: Icon(
                          confirmPasswordStatus
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm your password";
                      } else if (value != passwordController.text) {
                        // Compare the password
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 15.h),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        onTab: () {
                          _register();
                        },
                        title: "Sign Up",
                        width: 316.w,
                        height: 48.h,
                        textColor: Color(0xffFCFCFC),
                        radius: 41.r,
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                SizedBox(height: 10.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(right: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        title: "Already have an account? ",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        textColor: AppColors.deepGrey,
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(width: 4.w),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogingScreen()));
                        },
                        child: CustomText(
                          title: "Log in",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.primaryColor,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

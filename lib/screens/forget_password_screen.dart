// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, curly_braces_in_flow_control_structures, use_key_in_widget_constructors, unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:user_management/utils/constants/color.dart';

import 'package:user_management/screens/loging_screen.dart';
import 'package:user_management/screens/otp_screen.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  bool status = false;
  final _formKey = GlobalKey<FormState>();

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
                    "assets/s1.png",
                    width: 300.w,
                    height: 265.h,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 375.w,
                    padding: EdgeInsets.only(left: 30.w),
                    child: CustomText(
                      title: "Forget Password",
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColors.blackColor,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Enter your email to continue",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    textColor: AppColors.greyColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Email",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: const Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    onChanged: (Value) {},
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          width: 0.5.h,
                        )),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5.h, color: Colors.grey)),
                        errorBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 0.5.h, color: Colors.red))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter you email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onTab: () {},
                  title: "Continue",
                  width: 316.w,
                  height: 48.h,
                  textColor: const Color(0xffFCFCFC),
                  radius: 41.r,
                  color: AppColors.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
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
                      SizedBox(
                        width: 4.w,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(const LogingScreen());
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

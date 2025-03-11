// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_types_as_parameter_names, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:user_management/utils/constants/color.dart';

import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
                      title: "Verify OTP",
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
                    title: "Enter your credential to continue",
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
                    title: "Mobile",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
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
                SizedBox(height: 20.h),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "OTP Code",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
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
                  textColor: Color(0xffFCFCFC),
                  radius: 41.r,
                  color: AppColors.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

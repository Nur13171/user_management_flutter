import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_management/utils/constants/color.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                    height: 272.h,
                  ),
                ),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "New Password",
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.blackColor,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Enter your emails and password",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    textColor: AppColors.greyColor,
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
                    textColor: const Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    onChanged: (value) {},
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
                    title: "Confirm Password",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: const Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                //  SizedBox(height: 10.h),
                SizedBox(
                  width: 317.w,
                  child: TextFormField(
                    onChanged: (value) {},
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
                              BorderSide(width: 0.5.h, color: Colors.red)),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              status = !status;
                            });
                          },
                          icon: status == true
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                    ),
                    obscureText: status,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter you password";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10.h),

                CustomButton(
                  onTab: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  title: "Submit",
                  width: 316.w,
                  height: 48.h,
                  textColor: const Color(0xffFCFCFC),
                  radius: 41.r,
                  color: AppColors.primaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

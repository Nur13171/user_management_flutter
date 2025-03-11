// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_management/utils/constants/color.dart';
import 'package:user_management/screens/loging_screen.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/start.png",
            ),
            scale: 1.0,
            fit: BoxFit.fill,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 325.h,
              ),
              Image.asset(
                "assets/logo.png",
                width: 54.17.w,
                height: 74.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomText(
                title: "Welcome \nto our store",
                textColor: Colors.white,
                fontSize: 48.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomText(
                title: "Ger your groceries in as fast as one hour",
                textColor: AppColors.textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomButton(
                onTab: () {
                  Get.to(LogingScreen());
                },
                title: "Get Started",
                width: 343.w,
                height: 56.h,
                radius: 57.r,
                color: AppColors.primaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_management/controllers/auth_controller.dart';

import 'package:user_management/screens/home_screen.dart';
import 'package:user_management/utils/constants/color.dart';

import 'package:user_management/screens/sign_up_screen.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class LogingScreen extends StatefulWidget {
  const LogingScreen({super.key});

  @override
  State<LogingScreen> createState() => _LogingScreenState();
}

class _LogingScreenState extends State<LogingScreen> {
  bool status = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                    height: 272.h,
                  ),
                ),
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Login",
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
                    controller: emailController,
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
                    title: "Password",
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
                    controller: passwordController,
                    onChanged: (value) {
                      debugPrint(value);
                    },
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

                SizedBox(height: 20.h),
                CustomButton(
                  onTab: () async {
                    if (_formKey.currentState!.validate()) {
                      // Get the email and password from the form fields
                      String email = emailController.text;
                      String password = passwordController.text;

                      // Call the login API
                      var response =
                          await AuthController.login(email, password);

                      if (response["success"]) {
                        // Navigate to Home screen on successful login
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      } else {
                        // Show error message on failed login
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response["error"])),
                        );
                      }
                    }
                  },
                  title: "Log in",
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
                // Container(
                //   width: 375.w,
                //   padding: EdgeInsets.only(right: 30.w),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       CustomText(
                //         title: "Don’t have an account?",
                //         fontSize: 14.sp,
                //         fontWeight: FontWeight.w600,
                //         textColor: AppColors.deepGrey,
                //         textAlign: TextAlign.right,
                //       ),
                //       SizedBox(
                //         width: 4.w,
                //       ),
                //       InkWell(
                //         onTap: () {
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => SignUpScreen()));
                //         },
                //         child: CustomText(
                //           title: "Singup",
                //           fontSize: 14.sp,
                //           fontWeight: FontWeight.w600,
                //           textColor: AppColors.primaryColor,
                //           textAlign: TextAlign.right,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

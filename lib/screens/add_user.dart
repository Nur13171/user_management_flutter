// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, avoid_types_as_parameter_names, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_management/controllers/user_controller.dart';
import 'package:user_management/models/user_model.dart';
import 'package:user_management/screens/drawer_screen.dart';

import 'package:user_management/utils/constants/color.dart';

import 'package:user_management/screens/loging_screen.dart';
import 'package:user_management/widgets/custom_button.dart';
import 'package:user_management/widgets/custom_text.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  bool status = false;
  final _formKey = GlobalKey<FormState>();

  bool passwordStatus = true; // To toggle password visibility
  bool confirmPasswordStatus = true; // To toggle confirm password visibility

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;
  var selectedRole;
  void _addUser() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      // Create user object
      UserModel newUser = UserModel(
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
        role: selectedRole,
      );

      // Call API
      var response = await UserController.addUser(newUser);

      setState(() {
        isLoading = false;
      });

      if (response["success"]) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Added Successful!")),
        );

        // Navigate to Login Screen
        //Navigator.pushReplacementNamed(context, "/login");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${response["error"]}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: const Text(
            'Add User',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 30.h),
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
                Container(
                  width: 375.w,
                  padding: EdgeInsets.only(left: 30.w),
                  child: CustomText(
                    title: "Role",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: Color(0xff828282),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  width: 317.w,
                  child: DropdownButtonFormField<String>(
                    value: selectedRole,
                    items: ['admin', 'user'].map((String role) {
                      return DropdownMenuItem(value: role, child: Text(role));
                    }).toList(),
                    onChanged: (value) => selectedRole = value!,
                  ),
                ),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        onTab: () {
                          _addUser();
                        },
                        title: "Add User",
                        width: 316.w,
                        height: 48.h,
                        textColor: Color(0xffFCFCFC),
                        radius: 41.r,
                        color: AppColors.primaryColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormWidget extends StatelessWidget {
  final hintText;
  
  CustomFormWidget({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 317.w,
      height: 40.h,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText?? "Hint Text",
          hintStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w500, 
          color: Color(0xff808080)
          ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Color(0xffE5E5E5)),
              borderRadius: BorderRadius.circular(10.r), 
              
            ), 
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1.w, color: Color(0xffE5E5E5)),
              borderRadius: BorderRadius.circular(10.r), 
              
            ), 
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0.5.h, color: Colors.red))),
      ),
    );
  }
}

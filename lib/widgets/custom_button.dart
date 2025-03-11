// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final title;
  final width;
  final height;
  final textColor;
  final fontSize;
  final fontWeight;
  final color;
  final radius;
  final margin;
  VoidCallback onTab;

  CustomButton({
    this.title,
    this.width,
    this.height,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.color,
    this.radius,
    this.margin,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        alignment: Alignment.center,
        width: width ?? 100.w,
        height: height ?? 35.h,
        decoration: BoxDecoration(
          color: color ?? Colors.black,
          border: Border.all(width: 0.5, color: Colors.black12),
          borderRadius: BorderRadius.circular(radius ?? 15.r),
        ),
        margin: margin ?? EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
        child: Text(
          "$title",
          style: GoogleFonts.inter(
              fontSize: fontSize ?? 12.sp,
              fontWeight: fontWeight ?? FontWeight.w700,
              color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}

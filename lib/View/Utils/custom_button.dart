import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.mainColor,
    required this.onPressed,
  });
  final String text;
  final Color mainColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed(),
      child: Container(
        margin: EdgeInsets.only(top: 30.sp),
        height: 50.sp,
        width: 1.sw,
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.circular(30.sp),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp,
            ),
          ),
        ),
      ),
    );
  }
}
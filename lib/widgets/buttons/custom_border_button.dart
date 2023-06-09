import 'package:flutter/material.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:sizer/sizer.dart';

class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.showShadow = false,
    this.backgroundColor = AppColors.white,
    this.borderColor = AppColors.primary,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final bool showShadow;
  final Color backgroundColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: backgroundColor,
            border: Border.all(color: borderColor),
            boxShadow: showShadow
                ? const [
                    BoxShadow(
                        color: AppColors.textGrey,
                        offset: Offset(0, 3),
                        blurRadius: 6)
                  ]
                : []),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Text(
              title,
              style: Utilities.setTextStyle(
                14.sp,
                FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

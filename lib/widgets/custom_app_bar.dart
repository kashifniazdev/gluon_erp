import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/pages/login.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.actionIconPath,
      this.onActionTap,
      this.showBackButton = false,
      this.showLogoutIcon = false})
      : super(key: key);
  final String title;
  final String? actionIconPath;
  final VoidCallback? onActionTap;
  final bool showBackButton, showLogoutIcon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(top: 6),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (showBackButton)
                    InkWell(
                      onTap: Get.back,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 12.0, 8.0),
                        child: Icon(
                          Icons.keyboard_arrow_left_outlined,
                          color: AppColors.textBlack,
                          size: 36.sp,
                        ),
                      ),
                    ),
                  Text(
                    title,
                    style: Utilities.setTextStyle(
                      20.sp,
                      FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (actionIconPath != null)
                    InkWell(
                      onTap: onActionTap,
                      child: Image.asset(
                        actionIconPath!,
                        width: 20.sp,
                      ),
                    ),
                  if (showLogoutIcon)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () => Get.offAll(const LoginPage()),
                        child: Icon(
                          Icons.logout,
                          color: AppColors.primary,
                          size: 22.sp,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.sp);
}

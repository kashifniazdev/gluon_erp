import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:gluon_erp/constants/assets/app_images.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/pages/login.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textGrey,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Menu',
                    style: Utilities.setTextStyle(16, FontWeight.w600,
                        color: AppColors.textGrey),
                  ),
                  const SizedBox(), // Adjust the width as needed
                ],
              ),
              const SizedBox(height: 15), // Adjust the width as needed

              IntrinsicHeight(
                child: Row(
                  children: [
                     CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(AppImages.avatar, color: AppColors.textGrey,),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          FittedBox(
                            child: Text(
                              email,
                              style: Utilities.setTextStyle(16, FontWeight.w600,
                                  color: AppColors.textGrey),
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            endIndent: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textGrey.withOpacity(0.2)),
                  width: 50,
                  child:  Image.asset(AppIcons.logout),
                ),
                title: Text(
                  'Logout',
                  style: Utilities.setTextStyle(16, FontWeight.w500,
                      color: AppColors.textGrey),
                ),
                onTap: () {
                  box.erase();
                  Get.offAll(const LoginPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

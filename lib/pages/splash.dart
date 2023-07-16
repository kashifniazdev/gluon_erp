import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gluon_erp/constants/assets/app_images.dart';
import 'package:gluon_erp/controllers/splash_controller.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashPageController>(
      init: SplashPageController(),
      builder: (controller) => Scaffold(
          body: Center(
        child:Image.asset(
                AppImages.logo,
                width: 80.w,
              ),
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:gluon_erp/constants/assets/app_images.dart';
import 'package:gluon_erp/constants/utilities.dart';
import 'package:gluon_erp/controllers/login_controller.dart';
import 'package:gluon_erp/utils/mixins/textfield_validation.dart';
import 'package:gluon_erp/widgets/custom_button.dart';
import 'package:gluon_erp/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget with TextFieldValidator {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(20.0.sp),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Center(
                        child: Text(
                          "Login",
                          style: Utilities.setTextStyle(
                            30.sp,
                            FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Welcome Back",
                      style: Utilities.setTextStyle(
                        20.sp,
                        FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Login to access your account",
                      style: Utilities.setTextStyle(
                        12.sp,
                        FontWeight.w400,
                        color: AppColors.textGrey,
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    CustomTextField(
                      hint: "Email",
                      prefixIcon: AppIcons.email,
                      validator: validateEmail,
                      controller: controller.tfEmail,
                    ),
                    SizedBox(height: 20.sp),
                    CustomTextField(
                      hint: "Password",
                      maxLines: 1,
                      prefixIcon: AppIcons.lock,
                      isPasswordField: true,
                      controller: controller.tfPassword,
                    ),
                    SizedBox(height: 30.sp),
                    CustomButton(title: "Login", onTap: controller.onLogin)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

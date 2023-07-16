import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Pages/home.dart';
import 'package:gluon_erp/constants/app_keys.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/login_model.dart';
import 'package:gluon_erp/services/api_functions.dart';
import 'package:gluon_erp/services/urls.dart';
import 'package:gluon_erp/utils/mixins/drop_down_list.dart';

class LoginPageController extends GetxController with DropDownListMixin {
  late TextEditingController tfEmail, tfPassword;
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  void onInit() {
    _initializeFields();
    super.onInit();
  }

  void _initializeFields() {
    tfEmail = TextEditingController();
    tfPassword = TextEditingController();
  }

  bool _validateFields() => loginFormKey.currentState!.validate();

  void onLogin() async {
    bool ifFieldsAreValid = _validateFields();

    if (ifFieldsAreValid) {
      LoginModel? loginResponse = await apiCall(
          POST, Urls.login, _createDataMap(),
          model: LoginModel());

      if (loginResponse != null && loginResponse.accessToken.isNotEmpty) {
        authToken = loginResponse.accessToken;
        getFiltersData();
        userId = loginResponse.userId;
        _saveLoginResponseToLocalStorage(loginResponse);
        _saveUserEmail();
        Get.off(() => const HomePage());
      }
    }
  }

  Map<String, dynamic> _createDataMap() =>
      {"password": tfPassword.text, "userNameOrEmailAddress": tfEmail.text};

  void _saveLoginResponseToLocalStorage(LoginModel loginModel) =>
      box.write(AppKeys.loginResponse, loginModel.toJson());

  void _saveUserEmail(){
    email = tfEmail.text.trim();
    box.write(AppKeys.email, email);

  }
}

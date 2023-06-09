import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Pages/home.dart';
import 'package:gluon_erp/constants/app_keys.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/login_model.dart';
import 'package:gluon_erp/pages/login.dart';
import 'package:gluon_erp/utils/mixins/drop_down_list.dart';

class SplashPageController extends GetxController with DropDownListMixin {
  bool appStatus = true;
  String message = '';

  @override
  void onReady() async {
    await _checkAppStatus();
    Future.delayed(const Duration(seconds: 0), () {
      if (appStatus) _getLoginResponseFromLocalStorage();
    });
    super.onReady();
  }

  void _getLoginResponseFromLocalStorage() {
    final data = box.read(AppKeys.loginResponse);
    if (data != null) {
      LoginModel loginResponse = LoginModel().fromJson(data);
      authToken = loginResponse.accessToken;
      userId = loginResponse.userId;
    }
    getFiltersData();
    Future.delayed(const Duration(seconds: 2), () {
      _navigateToRespectivePage();
    });
  }

  void _navigateToRespectivePage() {
    authToken.isNotEmpty
        ? Get.off(() => const HomePage())
        : Get.off(() => const LoginPage());
  }

  Future<void> _checkAppStatus() async {
    await FirebaseFirestore.instance
        .collection("erp")
        .doc("validate")
        .get()
        .then((value) {
      appStatus = value.data()?["status"] ?? true;
      message = value.data()?["message"] ?? "";
    });

    update();
  }
}

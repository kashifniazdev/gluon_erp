


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';


class Utilities {
  static TextStyle setTextStyle(double size, FontWeight fontWeight,
          {Color color = AppColors.textBlack}) =>
      GoogleFonts.poppins(
          fontSize: size, fontWeight: fontWeight, color: color);

  static showErrorMessage(
      {String title = 'Error', String? error, int? miliSecond = 800}) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    return Get.snackbar(title, error ?? "Something went wrong, Try again",
        colorText: AppColors.red,
        backgroundColor: AppColors.white,
        animationDuration: Duration(milliseconds: miliSecond ?? 0));
  }

  static showSuccessMessage(
      {String title = 'Success', String? message, int? miliSecond = 800}) {
    if (Get.isSnackbarOpen) Get.closeAllSnackbars();
    return Get.snackbar(title, message ?? "Successfully done",
        colorText: AppColors.primary,
        backgroundColor: AppColors.white,
        animationDuration: Duration(milliseconds: miliSecond ?? 0));
  }


  // static String formatIntoCompleteDate(String? dateTime) {
  //   DateFormat formatter = DateFormat('dd/MM/yyyy');
  //   if (dateTime != null) {
  //     return formatter.format(DateTime.parse(dateTime)).toString();
  //   }
  //   return "";
  // }

}

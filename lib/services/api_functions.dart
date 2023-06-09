// ignore_for_file: constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:gluon_erp/Widgets/custom_loader.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/base_model.dart';
import 'package:gluon_erp/pages/login.dart';
import 'package:http/http.dart' as http;

import '../Constants/utilities.dart';
import 'dart:io';

const String GET = "GET";
const String POST = "POST";
const String UPDATE = "UPDATE";
const String DELETE = "DELETE";
const String PATCH = "PATCH";

Future<dynamic> apiCall(
    String method, String endPoint, var dataMap,
    {var model, bool showLoader = true, File? file}) async {
  if (showLoader) Get.dialog(const CustomLoader());

   log(authToken);

  try {
    var headers = {
      "Authorization": "Bearer $authToken",
      "Content-Type": "application/json"
    };

    log("Data: ${json.encode(dataMap)}"
        "\n Url: $endPoint");

    var request = http.Request(method, Uri.parse(endPoint));

    request.body = jsonEncode(dataMap);

    // if (file != null) {
    //   request.files.add(
    //     await http.MultipartFile.fromPath("file", file.path),
    //   );
    // }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

     log("statusCode: " + response.statusCode.toString());
    String? data = await response.stream.bytesToString();
    final decodedResponse = json.decode(data);
     log("decodedResponse $decodedResponse");

    final BaseModel baseModel = BaseModel.fromJson(decodedResponse);


    var result;
    if (response.statusCode == 200 && (baseModel.success ?? false)) {
      // log(baseModel.result.toString());
      if (model != null) {
        if (baseModel.result is List) {
          result = [];
          for (final data in baseModel.result) {
            result.add(model.fromJson(data as Map<String, dynamic>));
          }
          print(result.length);
        } else {
          result = model.fromJson(baseModel.result);
          print("result");
          print(result);
        }
      }

      if (showLoader) Get.back();

      return result ?? baseModel.result;
    }
    if (showLoader) Get.back();
    Utilities.showErrorMessage(error: baseModel.error?.message);
    if (response.statusCode == 500 && baseModel.error?.code == 0) {
      Get.offAll(() => const LoginPage());
    }
    return null;
  } catch (e) {
    if (showLoader) Get.back();
    // print("error: $e");
    Utilities.showErrorMessage();
    return null;
  }
}

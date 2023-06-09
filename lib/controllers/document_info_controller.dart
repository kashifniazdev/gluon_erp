import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/approval_model.dart';
import 'package:gluon_erp/models/approvals/approval_detail_model.dart';
import 'package:gluon_erp/services/api_functions.dart';
import 'package:gluon_erp/services/urls.dart';

class DocumentInfoPageController extends GetxController {
  DocumentInfoPageController(this.approvalData);

  final ApprovalModel approvalData;
  late TextEditingController tfRemarks;
  ApprovalDetailModel? approvalDetail;

  @override
  void onInit() {
    tfRemarks = TextEditingController(text: approvalData.remarks);
    super.onInit();
  }

  @override
  onReady() {
    _fetchApprovalDetailsFromAPI();
    super.onReady();
  }

  Future<void> _fetchApprovalDetailsFromAPI() async {
    final apiResponse = await apiCall(
        POST,
        // "${Urls.approvalDetail}approvalId=59797&approvalDetailId=61017&level=1",
        "${Urls.approvalDetail}approvalId=${approvalData.approvalId}&approvalDetailId=${approvalData.approvalDetailId}&level=${approvalData.approvalAuthority?.level}",
        approvalData.form?.name,
        model: ApprovalDetailModel());
    if (apiResponse != null) {
      approvalDetail = apiResponse;
    }
    update();
  }

  Future<void> changeApprovalStatus({bool isApprovalAccepted = true}) async {
    final apiResponse = await apiCall(
        POST,
        _getApprovalEndPoint(isApprovalAccepted),
        _createChangeApprovalStatusBody(),
        model: ApprovalModel());
    if (apiResponse != null) {
      Get.put(HomePageController())
        ..activeList.remove(approvalData)
        ..update();
      Get.back();
    }
  }

  String _getApprovalEndPoint(bool isApprovalAccepted) => isApprovalAccepted
      ? Urls.approveSingleApproval
      : Urls.rejectSingleApproval;

  Map<String, dynamic> _createChangeApprovalStatusBody() {
    return (approvalData
          ..approvedById = userId
          ..remarks = tfRemarks.text)
        .toJson();
  }
}

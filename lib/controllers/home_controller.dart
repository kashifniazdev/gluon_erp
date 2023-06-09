import 'dart:convert';
import 'dart:typed_data';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/approval_model.dart';
import 'package:gluon_erp/models/filters/company_model.dart';
import 'package:gluon_erp/models/filters/filter_data_model.dart';
import 'package:gluon_erp/pages/document_info.dart';
import 'package:gluon_erp/services/api_functions.dart';
import 'package:gluon_erp/services/urls.dart';
import 'package:gluon_erp/widgets/dialogs/filter_dialog.dart';
import 'dart:io';
import 'package:gluon_erp/widgets/dialogs/remarks_dialog.dart';
import 'package:path_provider/path_provider.dart';

class HomePageController extends GetxController {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  // bool _loading = false;
  List<ApprovalModel> _pendingApprovalList = [],
      _approvedApprovalList = [],
      _rejectedApprovalList = [],
      _selectedApprovalList = [],
      activeList = [];

  late final ScrollController _scrollController;

  ScrollController get scrollController => _scrollController;

  FilterDataModel filterData = FilterDataModel();
  bool isSelectionModeActive = false, isEveryApprovalSelected = false;

  late final TextEditingController tfRemarks, tfSearch;

  void _initializeControllers() {
    tfRemarks = TextEditingController();
    tfSearch = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void onInit() {
    super.onInit();
    _initializeControllers();
  }

  @override
  void onReady() async {
    await _fetchApprovalsFromApi();
    activeList = _getActiveList();
    update();
    super.onReady();
  }

  void onFilterIconTap() {
    Get.dialog(
      FilterDialog(filterData: filterData),
    );
  }

  void onHomeBarSelection(int value) async {
    if (value != _pageIndex) {
      _pageIndex = value;
      await _fetchApprovalsFromApi();
      activeList = _getActiveList();
      update();
    }
  }

  void activateSelectionMode() {
    isSelectionModeActive = true;
    update();
  }

  void onApproveTap(ApprovalModel data) {
    if (isSelectionModeActive) {
      data.isSelected = !data.isSelected;
      data.isSelected
          ? _selectedApprovalList.add(data)
          : _selectedApprovalList.remove(data);
      isEveryApprovalSelected =
          _selectedApprovalList.length == activeList.length;

      update();
    } else {
      Get.to(() => DocumentInfoPage(data: data));
    }
  }

  void selectAllApprovals() {
    isEveryApprovalSelected = !isEveryApprovalSelected;
    _selectedApprovalList.clear();
    for (ApprovalModel approval in activeList) {
      approval.isSelected = isEveryApprovalSelected;
      if (isEveryApprovalSelected) _selectedApprovalList.add(approval);
    }
    update();
  }

  // void acceptOrRejectSelectedApprovals() {
  //   Get.dialog(RemarksDialog(
  //     controller: controller,
  //   ));
  // }

  void clearSelectionMode() {
    isEveryApprovalSelected = false;
    _selectedApprovalList.clear();
    isSelectionModeActive = false;
    for (ApprovalModel approval in activeList) {
      approval.isSelected = false;
    }
    update();
  }

  Future<void> changeSelectedApprovalStatus(
      {bool isApprovalAccepted = true}) async {
    final apiResponse = await apiCall(
        POST,
        _getSelectedApprovalEndPoint(isApprovalAccepted),
        _createChangeApprovalStatusBody(),
        model: ApprovalModel());
    if (apiResponse != null) {
      tfRemarks.clear();
      Get.back();
      onReady();
    }
  }

  String _getSelectedApprovalEndPoint(bool isApprovalAccepted) =>
      isApprovalAccepted
          ? Urls.approveMultipleApprovals
          : Urls.rejectMultipleApprovals;

  List<Map<String, dynamic>> _createChangeApprovalStatusBody() {
    final List<Map<String, dynamic>> list = [];
    for (ApprovalModel approval in _selectedApprovalList) {
      approval
        ..approvedById = userId
        ..remarks = tfRemarks.text;
      list.add(approval.toJson());
    }
    return list;
  }

  // _fetchDataOnListScroll() {
  //   _scrollController.addListener(() {
  //     double nextPageTrigger = _scrollController.position.maxScrollExtent * 0.8;
  //
  //     if (_scrollController.position.pixels > nextPageTrigger && !_loading) {
  //       _loading = true;
  //     }
  //   });
  // }

  // Map<String, dynamic> _createApprovalFilterBody(
  //         {int? formId,
  //         int? companyId,
  //         int? stationId,
  //         int? costCenterId,
  //         int? docNo,
  //         List<String>? dateRange}) =>
  //     {
  //       "formID": formId,
  //       "companyId": companyId,
  //       "stationId": stationId,
  //       "costCenterId": costCenterId,
  //       "docNo": docNo,
  //       if (dateRange != null) "dateRanges": dateRange
  //     };

  Future<void> _fetchApprovalsFromApi() async {
    List<ApprovalModel>? approvalsList = [];
    final apiResponse = await apiCall(
        POST, _getApprovalEndPoint(), filterData.toJson(),
        model: ApprovalModel());
    if (apiResponse != null) {
      for (final data in apiResponse) {
        approvalsList.add(data);
      }
    }
    print(approvalsList.length);
    _setApprovalList(approvalsList);
    update();
  }

  String _getApprovalEndPoint() => _pageIndex == 0
      ? Urls.getPendingApprovals
      : _pageIndex == 1
          ? Urls.getApprovedApprovals
          : Urls.getRejectedApprovals;

  void _setApprovalList(List<ApprovalModel> list) => pageIndex == 0
      ? _pendingApprovalList = list
      : _pageIndex == 1
          ? _approvedApprovalList = list
          : _rejectedApprovalList = list;

  List<ApprovalModel> _getActiveList() => pageIndex == 0
      ? _pendingApprovalList
      : _pageIndex == 1
          ? _approvedApprovalList
          : _rejectedApprovalList;

  Future<void> _saveBase64AsPDF(String base64String, int approvalId) async {
    final Uint8List bytes = base64.decode(base64String);

    final dir = Platform.isAndroid
        ? await getExternalStorageDirectory() //FOR ANDROID
        : await getApplicationSupportDirectory();
    final file = File('${dir?.path}/$approvalId.pdf');
    print(dir);

    await file.writeAsBytes(bytes, flush: true);
    Utilities.showSuccessMessage(message: "File Saved to $dir");
  }

  void fetchBase64FromAPI(int approvalId, String formName) async {
    String base64String = await apiCall(GET,
        "${Urls.getPDF}$approvalId&form=SalesInvoice&PrintName=Default", {});
    print(base64String);
    _saveBase64AsPDF(base64String,approvalId);
  }
}

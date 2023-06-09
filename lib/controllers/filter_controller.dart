import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/models/filters/company_model.dart';
import 'package:gluon_erp/models/filters/filter_data_model.dart';
import 'package:gluon_erp/utils/extensions/date_time_extension.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FilterController extends GetxController {
  final FilterDataModel filterData;
  late final SingleValueDropDownController tfCompany,
      tfStation,
      tfForm,
      tfCostCenter;

  late final TextEditingController tfDocNo, tfDate;
  DateTime? rangeStartDate, rangeEndDate;

  FilterController(this.filterData);

  void _initializeControllers() {
    print(filterData.toJson());
    tfCompany = SingleValueDropDownController(
        data: _applyInitialFilterToDropDownControllers(
            companyList, filterData.companyId));
    tfStation = SingleValueDropDownController(
        data: _applyInitialFilterToDropDownControllers(
            stationList, filterData.stationId));
    tfForm = SingleValueDropDownController(
        data: _applyInitialFilterToDropDownControllers(
            formList, filterData.formID));
    tfDocNo = TextEditingController(text: filterData.docNo);
    tfDate = TextEditingController();
    tfCostCenter = SingleValueDropDownController(
        data: _applyInitialFilterToDropDownControllers(
            [], filterData.costCenterId));
  }

  void _setDateToTextFiled() {
    String date = "";
    if (rangeStartDate != null) {
      date = rangeStartDate!.toString().toFormattedDate();
    }
    if (rangeEndDate != null) {
      date = "$date - ${rangeEndDate!.toString().toFormattedDate()}";
    }
    tfDate.text = date;
  }

  void _initializeDates() {
    if (filterData.dateRanges != null) {
      rangeStartDate = filterData.dateRanges![0].toDateTime();
      if (filterData.dateRanges!.length == 2) {
        rangeEndDate = filterData.dateRanges![1].toDateTime();
      }
    }
  }

  @override
  void onInit() {
    _initializeDates();
    _initializeControllers();
    _setDateToTextFiled();
    super.onInit();
  }

  void _onDateSelectionChanged(rangeSelection) {}

  List<DropDownValueModel> createDropDownList(List<FilterModel> list) {
    List<DropDownValueModel> dropDownList = [];
    for (FilterModel data in list) {
      if (data.name.isNotEmpty && data.id != null) {
        dropDownList.add(DropDownValueModel(name: data.name, value: data.id));
      }
    }
    return dropDownList;
  }

  DropDownValueModel? _applyInitialFilterToDropDownControllers(
      List<FilterModel> list, int? id) {
    DropDownValueModel? dropDownValueModel;
    FilterModel? data;

    if (id != null) {
      for (FilterModel filter in list) {
        if (filter.id == id) {
          data = filter;
          break;
        }
      }
    }
    if (data != null) {
      dropDownValueModel = DropDownValueModel(name: data.name, value: data.id);
    }

    return dropDownValueModel;
  }

  void showCalendar() {
    Get.dialog(
      Dialog(
        child: SizedBox(
          height: 55.h,
          width: 80.w,
          child: Center(
            child: SfDateRangePicker(
              initialSelectedRange:
                  PickerDateRange(rangeStartDate, rangeEndDate),
              onSelectionChanged: _onDateSelectionChanged,
              selectionMode: DateRangePickerSelectionMode.range,
              backgroundColor: Colors.white,
              showActionButtons: true,
              onCancel: Get.back,
              onSubmit: (Object? value) {
                if (value is PickerDateRange) {
                  rangeStartDate = value.startDate;
                  rangeEndDate = value.endDate;
                }
                _setDateToTextFiled();
                Get.back();
              },
            ),
          ),
        ),
      ),
      useSafeArea: true,
    );
  }

  List<String>? _getDateRange() {
    List<String>? list;
    if (rangeStartDate != null) list = [rangeStartDate!.toIso8601String()];
    if (rangeEndDate != null) {
      list ??= [];
      list.add(rangeEndDate!.toIso8601String());
    }
    return list;
  }

  void onFilterApplied() {
    Get.back();
    Get.put(HomePageController())
      ..filterData = FilterDataModel(
          companyId: tfCompany.dropDownValue?.value,
          docNo: tfDocNo.text,
          formID: tfForm.dropDownValue?.value,
          stationId: tfStation.dropDownValue?.value,
          costCenterId: tfCostCenter.dropDownValue?.value,
          dateRanges: _getDateRange())
      ..onReady();
  }

  void onFilterClear() {
    Get.back();
    Get.put(HomePageController())
      ..filterData = FilterDataModel()
      ..onReady();
  }
}

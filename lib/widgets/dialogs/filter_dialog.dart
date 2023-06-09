import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/constants/constants.dart';
import 'package:gluon_erp/controllers/filter_controller.dart';
import 'package:gluon_erp/models/filters/filter_data_model.dart';
import 'package:gluon_erp/widgets/buttons/custom_border_button.dart';
import 'package:gluon_erp/widgets/custom_button.dart';
import 'package:gluon_erp/widgets/custom_drop_down_field.dart';
import 'package:gluon_erp/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key, required this.filterData})
      : super(key: key);

  final FilterDataModel filterData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(filterData),
      builder: (controller) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Filter Approvals by",
                  style: Utilities.setTextStyle(
                    14.sp,
                    FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.sp),
                CustomDropDownFiled(
                  hint: "Company",

                  controller: controller.tfCompany,
                  dropDownList: controller.createDropDownList(companyList),
                ),
                CustomTextField(
                  hint: "Doc No",
                  hintTextColor: AppColors.textBlack,
                  controller: controller.tfDocNo,
                  showBorders: true,
                  borderColor: AppColors.greyE0,
                  verticalPadding: 0,
                  maxLines: 1,
                ),
                const SizedBox(height: 20),
                CustomDropDownFiled(
                  hint: "Station",
                  controller: controller.tfStation,
                  dropDownList: controller.createDropDownList(stationList),
                ),
                CustomDropDownFiled(
                  hint: "Cost Center",
                  controller: controller.tfCostCenter,
                  dropDownList: controller.createDropDownList(costCenterList),
                ),
                CustomTextField(
                  hint: "Date",
                  hintTextColor: AppColors.textBlack,
                  suffixIcon: Icons.calendar_month_sharp,
                  controller: controller.tfDate,
                  showBorders: true,
                  borderColor: AppColors.greyE0,
                  verticalPadding: 0,
                  iconColor: AppColors.primary,
                  onSuffixTap: controller.showCalendar,
                ),
                const SizedBox(height: 20),
                CustomDropDownFiled(
                  hint: "From",
                  controller: controller.tfForm,
                  dropDownList: controller.createDropDownList(formList),
                ),
                Row(
                  children: [
                    Expanded(
                     // width: 160,
                      child: CustomBorderButton(
                        title: "Clear Filter",
                        onTap: controller.onFilterClear,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                     // width: 160,
                      child: CustomButton(
                        title: "Apply Filter",
                        onTap: controller.onFilterApplied,
                      ),
                    ),



                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

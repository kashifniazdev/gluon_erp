import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/utils/extensions/date_time_extension.dart';
import 'package:gluon_erp/widgets/custom_button.dart';
import 'package:gluon_erp/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class RemarksDialog extends StatelessWidget {
  const RemarksDialog({Key? key, required this.controller}) : super(key: key);
  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${controller.getSelectedApprovalDocLength()} Document${controller.getSelectedApprovalDocLength() > 1 ? 's' : ''} selected",
                  style: Utilities.setTextStyle(
                    10.sp,
                    FontWeight.w600,
                  ),
                ),
                Text(
                  DateTime.now().toFormattedString(),
                  style: Utilities.setTextStyle(
                    14.sp,
                    FontWeight.w600,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 4.sp),
            CustomTextField(
              hint: "Remarks....",
              hintTextColor: AppColors.textGrey80,
              borderColor: AppColors.textBlack,
              showBorders: true,
              maxLines: 4,
              controller: controller.tfRemarks,
            ),
            SizedBox(height: 5.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    title: "Reject",
                    onTap: () => controller.changeSelectedApprovalStatus(
                        isApprovalAccepted: false),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 3,
                  child: CustomButton(
                    title: "Approve",
                    onTap: () => controller.changeSelectedApprovalStatus(
                        isApprovalAccepted: true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

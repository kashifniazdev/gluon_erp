import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:gluon_erp/models/approval_model.dart';
import 'package:gluon_erp/pages/document_info.dart';
import 'package:gluon_erp/widgets/dialogs/remarks_dialog.dart';
import 'package:sizer/sizer.dart';
import 'package:gluon_erp/utils/extensions/date_time_extension.dart';

class ApprovalsCard extends StatelessWidget {
  const ApprovalsCard({
    Key? key,
    required this.data,
    required this.controller,
  }) : super(key: key);
  final ApprovalModel data;
  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onLongPress: controller.activateSelectionMode,
        onTap: () => controller.onApproveTap(data),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: data.isSelected
                ? AppColors.textGrey.withOpacity(0.2)
                : AppColors.lightGrey,
          ),
          child: Row(
            children: [
              if (controller.isSelectionModeActive)
                Checkbox(
                  activeColor: AppColors.primary,
                  value: data.isSelected,
                  onChanged: (value) => controller.onApproveTap(data),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.form?.displayName??"",
                      style: Utilities.setTextStyle(
                        10.sp,
                        FontWeight.w400,
                        // color: AppColors.textGrey
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10.sp),
                        Text(
                          data.docNo ?? "",
                          style: Utilities.setTextStyle(
                            10.sp,
                            FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 15.sp),
                        if (data.docDate != null)
                          Expanded(
                            child: Text(
                              data.docDate!.toFormattedDate(),
                              overflow: TextOverflow.ellipsis,
                              style: Utilities.setTextStyle(
                                  10.sp, FontWeight.w400,
                                  color: AppColors.textGrey80),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => controller.fetchBase64FromAPI(
                    data.approvalId!, data.form?.name ?? ""),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    AppIcons.download,
                    width: 24.sp,
                  ),
                ),
              ),
              Container(
                height: 40.sp,
                width: 5.sp,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.horizontal(right: Radius.circular(15)),
                  color: controller.pageIndex == 0
                      ? AppColors.primary
                      : controller.pageIndex == 1
                          ? AppColors.green
                          : AppColors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BuildStatusIndicator extends StatelessWidget {
  const _BuildStatusIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/Widgets/custom_loader.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:gluon_erp/controllers/document_info_controller.dart';
import 'package:gluon_erp/models/approval_model.dart';
import 'package:gluon_erp/widgets/buttons/custom_border_button.dart';
import 'package:gluon_erp/widgets/custom_app_bar.dart';
import 'package:gluon_erp/widgets/custom_button.dart';
import 'package:gluon_erp/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class DocumentInfoPage extends StatelessWidget {
  const DocumentInfoPage({Key? key, required this.data}) : super(key: key);
  final ApprovalModel data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentInfoPageController>(
      init: DocumentInfoPageController(data),
      builder: (controller) => Scaffold(
        appBar: CustomAppBar(
          title: "Document Info",
          showBackButton: true,
          actionIconPath: AppIcons.download,
          onActionTap: () => Get.put(HomePageController())
              .fetchBase64FromAPI(data.approvalId ?? -1, data.form?.name ?? ''),
          // showDownloadIcon: true,
        ),
        body: SingleChildScrollView(
          child: controller.approvalDetail != null
              ? Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    children: [
                      SizedBox(height: 3.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount:
                            controller.approvalDetail?.approvalPreviews.length,
                        itemBuilder: (BuildContext context, int index) =>
                            index == 0
                                ? _BuildCompanyWidget(
                                    title: controller
                                            .approvalDetail
                                            ?.approvalPreviews[index]
                                            .fieldName ??
                                        "",
                                    description: controller
                                            .approvalDetail
                                            ?.approvalPreviews[index]
                                            .fieldValue ??
                                        "",
                                  )
                                : _BuildInfoRow(
                                    title: controller
                                            .approvalDetail
                                            ?.approvalPreviews[index]
                                            .fieldName ??
                                        "",
                                    description: controller
                                            .approvalDetail
                                            ?.approvalPreviews[index]
                                            .fieldValue ??
                                        "",
                                  ),
                      ),
                      // _BuildInfoRow(
                      //   title: "Document No:",
                      //   description: data.docNo ?? "",
                      // ),
                      // _BuildInfoRow(
                      //   title: "Document Date:",
                      //   description: data.docDate ?? "",
                      // ),
                      // const _BuildInfoRow(
                      //   title: "Voucher Type:",
                      //   description: "SI",
                      // ),
                      // const _BuildInfoRow(
                      //   title: "Ref No:",
                      //   description: "SI-00050",
                      // ),
                      // const _BuildInfoRow(
                      //   title: "Details:",
                      //   description: "",
                      // ),
                      // const _BuildInfoRow(
                      //   title: "Currency:",
                      //   description: "PKR",
                      // ),
                      // const _BuildInfoRow(
                      //   title: "Source No:",
                      //   description: "GEPL-SI-23-01-000001",
                      // ),
                      // SizedBox(height: 15.sp),
                      CustomTextField(
                          hint: "Leave your remarks....",
                          hintTextColor: AppColors.textGrey80,
                          showBorders: true,
                          maxLines: 5,
                          controller: controller.tfRemarks),
                      SizedBox(height: 15.sp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomBorderButton(
                                title: "Reject",
                                onTap: () => controller.changeApprovalStatus(
                                  isApprovalAccepted: false,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              flex: 2,
                              child: CustomButton(
                                title: "Approve",
                                onTap: () => controller.changeApprovalStatus(
                                  isApprovalAccepted: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class _BuildCompanyWidget extends StatelessWidget {
  const _BuildCompanyWidget({Key? key, required this.title, this.description})
      : super(key: key);

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Utilities.setTextStyle(
            14.sp,
            FontWeight.w600,
            color: AppColors.textBlack,
          ),
        ),
        SizedBox(height: 10.sp),
        Text(
          description ?? "",
          style: Utilities.setTextStyle(10.sp, FontWeight.w400,
              color: AppColors.textGrey80),
        ),
        SizedBox(height: 20.sp),
      ],
    );
  }
}

class _BuildInfoRow extends StatelessWidget {
  const _BuildInfoRow({Key? key, required this.title, this.description})
      : super(key: key);

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.sp),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Utilities.setTextStyle(
                12.sp,
                FontWeight.w600,
                color: AppColors.textBlack,
              ),
            ),
          ),
          // SizedBox(width: 20.w),
          Expanded(
            child: Text(
              description ?? '',
              style: Utilities.setTextStyle(10.sp, FontWeight.w400,
                  color: AppColors.textGrey80),
            ),
          ),
        ],
      ),
    );
  }
}

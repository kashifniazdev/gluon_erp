import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/Controllers/home_controller.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:gluon_erp/widgets/approvals_card.dart';
import 'package:gluon_erp/widgets/custom_app_bar.dart';
import 'package:gluon_erp/widgets/custom_drawer.dart';
import 'package:gluon_erp/widgets/dialogs/remarks_dialog.dart';
import 'package:gluon_erp/widgets/home_bar.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => Scaffold(
        key: controller.scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: CustomAppBar(
          leadingIcon: Icons.menu_outlined,
          onLeadingIconTap: () =>
              controller.scaffoldKey.currentState?.openDrawer(),
          title: 'Approvals',
          actionIconPath: AppIcons.filter,
          onActionTap: controller.onFilterIconTap,
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeBar(onSelect: controller.onHomeBarSelection),
                SizedBox(height: 12.sp),
                CupertinoSearchTextField(
                  backgroundColor: AppColors.lightGrey,
                  controller: controller.tfSearch,
                  onChanged: (_) => controller.update(),
                  focusNode: controller.searchFocusNode,
                ),
                SizedBox(height: 12.sp),
                // Text(
                //   "Recent Approvals",
                //   style: Utilities.setTextStyle(10.sp, FontWeight.w400,
                //       color: AppColors.textGrey80),
                // ),
                // SizedBox(height: 15.sp),
                if (controller.isSelectionModeActive)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                activeColor: AppColors.primary,
                                value: controller.isEveryApprovalSelected,
                                onChanged: (value) =>
                                    controller.selectAllApprovals(),
                              ),
                              Text(
                                "Select all",
                                style: Utilities.setTextStyle(
                                    10.sp, FontWeight.w400,
                                    color: AppColors.textGrey80),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => Get.dialog(
                                  RemarksDialog(
                                    controller: controller,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.check,
                                    color: AppColors.green,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: controller.clearSelectionMode,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.close,
                                    color: AppColors.black,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8.sp),
                    ],
                  ),
                Expanded(
                  child: ListView.separated(
                    itemCount: controller.activeList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (controller.tfSearch.text.isEmpty ||
                              (controller.activeList[index].docNo ?? "")
                                  .toLowerCase()
                                  .contains(
                                      controller.tfSearch.text.toLowerCase()))
                          ? ApprovalsCard(
                              data: controller.activeList[index],
                              controller: controller,
                            )
                          : const SizedBox.shrink();
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

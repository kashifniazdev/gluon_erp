
import 'package:flutter/material.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/constants/enums.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeBar({
    Key? key,
    required this.onSelect,
  }) : super(key: key);
  final Function(int) onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.0,

      //preferredSize: const  Size.fromHeight(12.0),
      child: TabBar(
        indicatorColor: AppColors.white,
        unselectedLabelColor: AppColors.black,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: AppColors.primary, ),
        onTap: onSelect,


         // padding: EdgeInsets.all(10.sp),
        tabs: [
          Tab(
            child: FittedBox(
              child: Text(
                Approvals.Pending.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ),
          Tab(
            child: FittedBox(
              child: Text(
                Approvals.Approved.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 9.sp,
                ),
              ),
            ),
          ),
          Tab(
            child: FittedBox(
              child: Text(
                Approvals.Rejected.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 9.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );

    //   AnimatedButtonBar(
    //  // backgroundColor: Colors.white,
    //
    //   foregroundColor: AppColors.primary,
    //   radius: 50,
    //   animationDuration: Duration(milliseconds: 500),
    //   elevation: 0,
    //   borderWidth: 5,
    //   borderColor: AppColors.white,
    //   innerVerticalPadding: 20,
    //   padding: EdgeInsets.all(15.sp),
    //   invertedSelection: true,
    //   children: [
    //     ButtonBarEntry(
    //
    //       child: Text(
    //         Approvals.Pending.name,
    //         style: Utilities.setTextStyle(
    //           12.sp,
    //           FontWeight.bold,
    //           color: AppColors.white,
    //         ),
    //       ),
    //
    //       onTap: () => onSelect(Approvals.Pending.name),
    //     ),
    //     ButtonBarEntry(
    //       child: Text(
    //         Approvals.Approved.name,
    //         style: Utilities.setTextStyle(
    //           12.sp,
    //           FontWeight.bold,
    //           color: AppColors.white,
    //         ),
    //       ),
    //       onTap: () => onSelect(Approvals.Approved.name),
    //     ),
    //     ButtonBarEntry(
    //       child: Text(
    //         Approvals.Pending.name,
    //         style: Utilities.setTextStyle(
    //           12.sp,
    //           FontWeight.bold,
    //           color: AppColors.white,
    //         ),
    //       ),
    //       onTap: () => onSelect(Approvals.Rejected.name),
    //     ),
    //   ],
    // );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70.sp);
}



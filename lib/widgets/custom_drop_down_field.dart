import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:gluon_erp/constants/assets/app_icons.dart';
import 'package:sizer/sizer.dart';

class CustomDropDownFiled extends StatelessWidget {
  const CustomDropDownFiled({
    Key? key,
    required this.controller,
    required this.dropDownList,
    this.hint,
    this.onChange,
    this.fillColor,
    this.borderColor,
    this.title,
    this.dropDownIcon,
    this.initialValue
  }) : super(key: key);

  final SingleValueDropDownController controller;
  final List<DropDownValueModel> dropDownList;
  final String? hint, title;
  final void Function(String)? onChange;
  final Color? fillColor, borderColor;
  final IconData? dropDownIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // if (title != null)
        //   Column(
        //     children: [
        //       Text(
        //         title!,
        //      //   style: Utilities.setTextStyle(),
        //       ),
        //       SizedBox(height: 10),
        //     ],
        //   ),
        DropDownTextField(

          initialValue: initialValue,
          controller: controller,
          clearOption: false,
          enableSearch: false,
          dropDownIconProperty: IconProperty(
            icon: dropDownIcon ?? Icons.keyboard_arrow_down,
            color: AppColors.primary,
            size: 24.sp,
          ),


          textFieldDecoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),

            filled: true,
            fillColor: fillColor ?? Colors.white,
            // suffixIcon: Image.asset(AppIcons.downArrow),
            // suffix: Image.asset(AppIcons.downArrow),

            hintText: hint,

            // suffixIconColor: AppColors.primary,
            // suffix: Icon(Icons.keyboard_arrow_down,color: AppColors.primary),
            hintStyle: Utilities.setTextStyle(12.sp, FontWeight.w400),
            //  errorStyle: Utilities.setTextStyle(12, FontWeight.w300,
            //      color: AppColors.yellow),
            errorBorder: _setBorder(color: AppColors.red),
            focusedErrorBorder: _setBorder(),
            border: _setBorder(),
            enabledBorder: _setBorder(),
            focusedBorder: _setBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Required field *";
            } else {
              return null;
            }
          },
          dropDownItemCount: dropDownList.length,
          dropDownList: dropDownList,
          //  onChanged: (val) => onChange(val.name)??(){},
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  InputBorder _setBorder({Color color = AppColors.greyE0}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: color, width: 1));
}

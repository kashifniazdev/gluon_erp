import 'package:flutter/material.dart';
import 'package:gluon_erp/Constants/app_colors.dart';
import 'package:gluon_erp/Constants/utilities.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.isPasswordField = false,
    this.prefixIcon,
    this.borderRadius,
    this.fillColor,
    this.title,
    this.suffixIcon,
    this.hintTextColor = AppColors.primary,
    this.validator,
    this.readOnly = false,
    this.showBorders = false,
    this.onChanged,
    this.enabled,
    this.textColor = AppColors.textBlack,
    this.textCapitalization = TextCapitalization.none,
    this.iconColor = AppColors.textGrey,
    this.onSuffixTap,
    this.maxLines,
    this.borderColor = AppColors.textGrey80,
    this.verticalPadding = 8, this.keyboardType, this.onFieldSubmitted, this.focusNode,
  }) : super(key: key);

  final String hint;
  final TextEditingController controller;
  final bool isPasswordField;
  final double? borderRadius;
  final Color? fillColor;
  final String? title, prefixIcon;
  final IconData? suffixIcon;
  final Color hintTextColor, textColor, iconColor, borderColor;
  final FormFieldValidator? validator;
  final bool readOnly, showBorders;
  final bool? enabled;
  final void Function(String)? onChanged;
  final TextCapitalization textCapitalization;
  final VoidCallback? onSuffixTap;
  final int? maxLines;
  final double verticalPadding;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Column(
              children: [
                Text(
                  title!,
                  style: Utilities.setTextStyle(10.sp, FontWeight.w400,
                      color: AppColors.white),
                ),
                const SizedBox(height: 2)
              ],
            ),
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            textCapitalization: textCapitalization,
            keyboardType: keyboardType,
            obscureText: isPasswordField,
            readOnly: readOnly,
            enabled: enabled,
            maxLines: maxLines,
            style: Utilities.setTextStyle(12.sp, FontWeight.normal,
                color: textColor),
            validator: validator ??
                (value) => value!.toString().trim().isEmpty
                    ? "${title ?? hint} is required"
                    : null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              prefixIconConstraints: BoxConstraints(
                maxWidth: 32.sp,
              ),
              prefixIcon: prefixIcon != null
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        prefixIcon!,
                        // color: AppColors.textGrey,
                        //scale: 2,
                      ),
                    )
                  : null,
              suffixIcon: InkWell(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  color: iconColor,
                ),
              ),
              hintText: hint,
              hintStyle: Utilities.setTextStyle(
                12.sp,
                FontWeight.normal,
                color: hintTextColor,
              ),
              enabledBorder: _setOutlineBorder(),
              disabledBorder: _setOutlineBorder(),
              focusedBorder: _setOutlineBorder(),
              border: _setOutlineBorder(),
              // fillColor: Colors.white,
              // filled: true,
            ),
          ),
        ],
      ),
    );
  }

  InputBorder _setOutlineBorder() => showBorders
      ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          borderSide: BorderSide(color: borderColor),
        )
      : UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          borderSide: const BorderSide(color: AppColors.primary),
        );
}

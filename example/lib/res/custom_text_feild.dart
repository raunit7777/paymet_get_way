import 'package:flutter/material.dart';

import 'const_color.dart';

class CustomTextField3 extends StatelessWidget {
  final TextEditingController? controller;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Color? iconColor;
  final String? hintText;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final void Function(String)? onChanged;
  final double? height;
  final double? width;
  final double? hintSize;
  final double? fontSize;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final Color? cursorColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? fieldRadius;
  final bool? enabled;
  final void Function()? onTap;
  final bool autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry? margin;
  final Color? hintColor;
  final String? errorText;
  final BorderSide? borderSide;
  final Color? textColor;
  final FontWeight? fontWeight;
  final FontWeight? hintWeight;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autovalidateMode;

  // New properties for dropdown
  final List<String>? dropdownItems;  // List of items for the dropdown
  final String? dropdownValue;        // The current selected value
  final void Function(String?)? onDropdownChanged;  // Callback for dropdown change

  const CustomTextField3({
    super.key,
    this.controller,
    this.style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.minLines,
    this.maxLength,
    this.obscureText = false,
    this.keyboardType,
    this.icon,
    this.iconColor,
    this.hintText,
    this.filled,
    this.fillColor,
    this.focusColor,
    this.hoverColor,
    this.onChanged,
    this.height,
    this.width,
    this.hintSize,
    this.fontSize,
    this.border,
    this.borderRadius,
    this.boxShadow,
    this.contentPadding,
    this.cursorHeight,
    this.cursorColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fieldRadius,
    this.enabled,
    this.maxLines,
    this.onTap,
    this.autofocus = false,
    this.onSaved,
    this.validator,
    this.margin,
    this.hintColor,
    this.errorText,
    this.borderSide,
    this.textColor,
    this.fontWeight,
    this.hintWeight,
    this.textInputAction,
    this.autovalidateMode = AutovalidateMode.onUserInteraction, // Autovalidation mode
    this.dropdownItems,
    this.dropdownValue,
    this.onDropdownChanged,
  });

  @override
  Widget build(BuildContext context) {
    double heights = MediaQuery.of(context).size.height;
    double widths = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height ?? heights * 0.07,
        width: width ?? widths,
        decoration: BoxDecoration(
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        ),
        child: dropdownItems != null
            ? DropdownButtonFormField<String>(
          value: dropdownValue,
          onChanged: onDropdownChanged,
          items: dropdownItems!
              .map((String item) => DropdownMenuItem<String>(  // Dropdown items mapping
            value: item,
            child: Text(
              item,
              style: TextStyle(color: AppColor.kSelectItemColor),
            ),
          ))
              .toList(),
          decoration: InputDecoration(
            errorText: errorText,
            counter: const Offstage(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled ?? true,
            fillColor: fillColor ?? AppColor.iCardColor,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColor.kSecondaryColor),
            contentPadding: contentPadding ??
                const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
            border: OutlineInputBorder(
              borderSide: borderSide ?? const BorderSide(width: 1, color: AppColor.kToastTextColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide(width: 1, color: AppColor.kToastTextColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
          ),
        )
            : TextFormField(
          textInputAction: textInputAction ?? TextInputAction.done,
          validator: validator,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          autofocus: autofocus,
          textAlignVertical: TextAlignVertical.center,
          enabled: enabled,
          controller: controller,
          cursorColor: cursorColor ?? AppColor.kSecondaryColor,
          cursorHeight: cursorHeight,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          readOnly: readOnly,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: style ?? TextStyle(color: AppColor.kSelectItemColor),
          decoration: InputDecoration(
            errorText: errorText,
            counter: const Offstage(),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            filled: filled ?? true,
            fillColor: fillColor ?? AppColor.kBackgroundColor,
            hintText: hintText,
            hintStyle: TextStyle(color: AppColor.kToastTextColor),
            contentPadding: contentPadding ?? const EdgeInsets.only(left: 15, right: 15, top: 3, bottom: 3),
            border: OutlineInputBorder(
              borderSide: borderSide ?? const BorderSide(width: 5, color: AppColor.kToastTextColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide(width: 1, color: AppColor.kBlueColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide(width: 1, color: AppColor.kBlueColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: borderSide ?? BorderSide(width: 1, color: AppColor.kToastTextColor),
              borderRadius: fieldRadius ?? const BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
    );
  }
}

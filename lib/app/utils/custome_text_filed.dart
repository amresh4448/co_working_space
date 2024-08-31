import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.autofocus = false,
    this.textStyle,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.labelText,
    this.labelStyle,
    this.textAlign,
    this.errorText,
    this.filled = true,
    this.validator,
    this.enabled,
    this.inputFormatters,
    this.onTap,
    this.prefixText,
    this.maxLength,
  }) : super(key: key);

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final bool autofocus;
  final TextStyle? textStyle;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final bool filled;
  final TextAlign? textAlign;
  final bool? enabled;
  final FormFieldValidator<String>? validator;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormField(theme),
          )
        : _buildTextFormField(theme);
  }

  Widget _buildTextFormField(ThemeData theme) => SizedBox(
        width: width ?? double.infinity,
        child: TextFormField(
          maxLength: maxLength,
          enabled: enabled ?? true,
          scrollPadding: scrollPadding ??
              EdgeInsets.only(
                  bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
          controller: controller,
          onTap: onTap,
          autofocus: autofocus,
          style: textStyle ?? theme.textTheme.bodyLarge,
          obscureText: obscureText,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines ?? 1,
          decoration: _buildDecoration(theme),
          textAlign: textAlign ?? TextAlign.start,
          validator: validator,
          inputFormatters: inputFormatters,
        ),
      );

  InputDecoration _buildDecoration(ThemeData theme) => InputDecoration(
        counter: const SizedBox.shrink(),
        prefixText: prefixText,
        hintText: hintText ?? "",
        hintStyle: hintStyle ?? theme.textTheme.bodySmall,
        floatingLabelStyle: theme.textTheme.bodyMedium,
        errorText: errorText,
        errorStyle: TextStyle(
          color: theme.colorScheme.error,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelText: labelText ?? "",
        labelStyle: labelStyle ?? theme.textTheme.bodySmall,
        prefixIcon: prefix ?? const SizedBox(width: 16),
        prefixIconConstraints: prefixConstraints ??
            const BoxConstraints(maxHeight: 56),
        suffixIcon: suffix,
        suffixIconConstraints: suffixConstraints,
        isDense: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        fillColor: fillColor ?? theme.colorScheme.onPrimary,
        filled: filled,
        border: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.dividerColor,
                width: 1,
              ),
            ),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.dividerColor,
                width: 1,
              ),
            ),
        errorBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1,
              ),
            ),
        focusedErrorBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1,
              ),
            ),
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1,
              ),
            ),
      );
}

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlineBlack => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get fillGray => OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      );

  static OutlineInputBorder get fillGrayTL12 => OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      );
}

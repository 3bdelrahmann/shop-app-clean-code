import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inthekloud_shop_app/core/resources/app_colors.dart';
import 'package:inthekloud_shop_app/core/resources/app_fonts.dart';
import 'package:inthekloud_shop_app/core/resources/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.onChanged,
      required this.focusNode,
      this.onFieldSubmitted,
      this.textInputType,
      this.prefixIcon,
      this.obscureText = false,
      this.maxLines = 1,
      this.maxLength,
      this.textFieldEnabled = true,
      this.autofocus = false,
      this.keyboardType,
      required this.title})
      : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? textInputType;
  final IconData? prefixIcon;
  final bool obscureText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool textFieldEnabled;
  final bool autofocus;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      canRequestFocus: false,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      mouseCursor: SystemMouseCursors.text,
      onTap: () {
        focusNode.requestFocus();
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGrey,
                    blurRadius: 10.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  prefixIcon,
                  color: AppColors.green,
                ),
                Expanded(
                  child: TextFormField(
                    onChanged: onChanged,
                    onFieldSubmitted: onFieldSubmitted,
                    cursorColor: AppColors.green,
                    maxLines: maxLines,
                    maxLength: maxLength,
                    autofocus: autofocus,
                    obscureText: obscureText,
                    controller: controller,
                    focusNode: focusNode,
                    keyboardType: keyboardType,
                    enabled: textFieldEnabled,
                    textAlignVertical: TextAlignVertical.bottom,
                    style: AppTextStyles().getRegularStyle(
                        color: AppColors.green, fontSize: AppFontSize.s16),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 4.0,
            start: 10.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.lightGrey,
                      blurRadius: 10.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                title,
                style: AppTextStyles().getRegularStyle(
                    color: AppColors.green, fontSize: AppFontSize.s14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

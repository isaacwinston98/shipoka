import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shipoka/app/styles/app_color.dart';
import 'package:shipoka/app/styles/fonts.dart';
import 'package:shipoka/core/constant/app_asset.dart';
import 'package:shipoka/core/constant/fonts.dart';

class InputField extends StatefulWidget {
  const InputField({
    required this.controller,
    required this.placeholder,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.borderColorOnTap, // Initialize the new property
    this.formatter,
    this.onChanged,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.backgroundColor = AppColors.textFieldBackground,
    this.suffix,
    this.onTap,
    this.prefix,
    this.validationColor = Colors.transparent,
    this.height = 50,
    this.label,
    this.showLabel = false,
    this.placeholderColor = AppColors.personalProfileHint,
    this.labelTextColor = AppColors.personalProfileHint,
    Key? key,
  }) : super(key: key);
  final Color labelTextColor;
  final Color? borderColorOnTap; // New property for border color when tapped
  final Color placeholderColor;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final Function? onTap;
  final Function(String)? onChanged;
  final Color backgroundColor;
  final String? label;
  final bool showLabel;
  final int maxLines;
  final Widget? suffix;
  final Widget? prefix;
  final Color validationColor;
  final List<TextInputFormatter>? formatter;

  final double height;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late Color borderColor; // State variable to track border color
  late bool isPassword;
  double fieldHeight = 64;
  late bool isLabel;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
    isLabel = widget.showLabel;
    borderColor = widget.validationColor; // Initialize border color
  }

  bool activiateLabe = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: GestureDetector(
                  onTap: widget.showLabel
                      ? () {
                          setState(() {
                            activiateLabe = true;
                            // Change the border color when tapped
                            borderColor = widget.borderColorOnTap ?? AppColors.primaryColor;
                          });
                        }
                      : null,
                  child: Container(
                    height: widget.height,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(

                      color: widget.backgroundColor,
                      border: Border.all(color: borderColor), // Use the borderColor
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: <Widget>[
                        widget.prefix ?? const SizedBox(),
                        const Gap(10),
                        Expanded(
                          child: TextField(
                            onTap: widget.showLabel
                                ? () {
                                    setState(() {
                                      activiateLabe = true;
                                    });
                                    if (widget.enterPressed != null) {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      // ignore: avoid_dynamic_calls
                                      widget.enterPressed!();
                                    }
                                  }
                                : null,
                            controller: widget.controller,
                            cursorColor: AppColors.primaryColor,
                            keyboardType: widget.textInputType,
                            inputFormatters: widget.formatter ?? [],
                            focusNode: widget.fieldFocusNode,
                            textInputAction: widget.textInputAction,
                            onChanged: widget.onChanged,
                            onEditingComplete: () {},
                            obscureText: isPassword,
                            readOnly: widget.isReadOnly,
                            style: const TextStyle(color: AppColors.black),
                            decoration: InputDecoration(
                              hintText: widget.placeholder,
                              border: InputBorder.none,
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: widget.placeholderColor,
                                fontFamily: AppFonts.dmsans,
                              ),
                            ),
                          ),
                        ),
                        widget.suffix ??
                            GestureDetector(
                              onTap: () => setState(() {
                                isPassword = !isPassword;
                              }),
                              child: widget.password
                                  ? Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: isPassword
                                          ? SvgPicture.asset(
                                              AppAssets.invisible)
                                          : const Icon(
                                              Icons.visibility_rounded,
                                              color: Color(0xff71759D),
                                              size: 20,
                                            ),
                                    )
                                  : Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                    ),
                            ),
                      ],
                    ),
                  ),
                ),
              ),
              if (widget.showLabel)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: activiateLabe
                      ? Container(
                          color: AppColors.background,
                          child: SizedBox(
                            child: TextBody(
                              ' ${widget.label} ',
                              fontSize: 12,
                              color: widget.fieldFocusNode!.hasFocus
                                  ? AppColors.primaryColor
                                  : widget.labelTextColor,
                            ),
                          ),
                        )
                      : const SizedBox(),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: TextBody(
              widget.validationMessage!,
              color: Colors.red,
              fontSize: 10,
            ),
          )
        else
          const SizedBox(),
        if (widget.additionalNote != null) const Gap(5) else const SizedBox(),
        if (widget.additionalNote != null)
          TextBody(widget.additionalNote!)
        else
          const SizedBox(),
      ],
    );
  }
}

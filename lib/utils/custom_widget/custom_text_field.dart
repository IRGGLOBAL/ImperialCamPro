import 'package:campro/utils/custom_widget/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../data/common/theme_controller.dart';
import '../utils.dart';
import 'dimensions.dart';
import 'label_text.dart';
import 'my_color.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final FormFieldValidator<String>? validator;
  final TextInputType? textInputType;
  final bool isEnable;
  final bool isPassword;
  final bool isShowSuffixIcon;
  final bool isIcon;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final bool isSearch;
  final bool isCountryPicker;
  final TextInputAction inputAction;
  final bool needOutlineBorder;
  final bool readOnly;
  final bool needRequiredSign;
  final int maxLines;
  final bool animatedLabel;
  final Color fillColor;
  final TextStyle? autofillHintStyle;
  Color? focusColor = MyColor.getTextFieldEnableBorder();
  final bool isRequired;
  List<String>? autofillHints;

// edited /20-7-23
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final bool? isPin;

  // edited /29-7-2023
  final bool isborderNone;
  final VoidCallback? onSubmit;

  // edited /28-10-2023
  List<TextInputFormatter>? inputFormatters;
  final bool shadowBox;
  double? radius;


  //
  final bool isShowInstructionWidget;
  final String? instructions;
  final bool showLabel;
  final EdgeInsetsGeometry? contentPadding;

  CustomTextField(
      {super.key,
        this.showLabel = true,
        this.labelText,
        this.labelTextStyle,
        this.readOnly = false,
        this.fillColor = MyColor.colorWhite,
        this.focusColor,
        required this.onChanged,
        this.hintText,
        this.hintTextStyle,
        this.controller,
        this.focusNode,
        this.nextFocus,
        this.validator,
        this.textInputType,
        this.isEnable = true,
        this.isPassword = false,
        this.isShowSuffixIcon = false,
        this.isIcon = false,
        this.onSuffixTap,
        this.onTap,
        this.isSearch = false,
        this.isCountryPicker = false,
        this.inputAction = TextInputAction.next,
        this.needOutlineBorder = false,
        this.needRequiredSign = false,
        this.maxLines = 1,
        this.animatedLabel = false,
        this.isRequired = false,
        this.prefixIcon,
        this.suffixWidget,
        this.suffixIconConstraints,
        this.isDense,
        this.isborderNone = false,
        this.isPin = false,
        this.onSubmit,
        this.radius = Dimensions.mediumRadius,
        this.inputFormatters,
        this.shadowBox = false,
        this.autofillHints,
        this.isShowInstructionWidget = true,
        this.instructions,
        this.autofillHintStyle,
        this.contentPadding,
      });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  ThemeController themeController = Get.find<ThemeController>();

// build the state
  @override
  Widget build(BuildContext context) {
    return widget.needOutlineBorder
        ? widget.animatedLabel
        ? widget.shadowBox == false
        ?  Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style:
        regularDefault.copyWith(color: MyColor.getTextColor()),
        onTap: widget.onTap,
        cursorColor: MyColor.getTextColor(),
        controller: widget.controller,
        autofocus: false,
        textInputAction: widget.inputAction,
        enabled: widget.isEnable,
        focusNode: widget.focusNode,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? obscureText : false,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ??  EdgeInsetsDirectional.only(
              top: 0, start: 15, end: 15, bottom: 0),
          labelText: widget.labelText?.tr ?? '',
          labelStyle: widget.labelTextStyle ??
              regularDefault.copyWith(
                  color: MyColor.getRideSubTitleColor()),
          fillColor: widget.fillColor,
          filled: true,
          hintText: widget.hintText?.tr ?? '',
          hintStyle: widget.hintTextStyle ??
              TextStyle(color: MyColor.getRideSubTitleColor()),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: MyColor.secondaryColor.withValues(alpha: 0.9),
            ),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.5,
                color: widget.focusColor ??
                    MyColor.getTextFieldEnableBorder()),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: MyColor.secondaryColor
                      .withValues(alpha: 0.9)),
              borderRadius: BorderRadius.circular(widget.radius!)),
          prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
          prefixIcon: widget.prefixIcon,
          suffixIconConstraints: widget.suffixIconConstraints ??
              BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 70,
                  minHeight: 40,
                  minWidth: 50),
          suffixIcon: widget.isShowSuffixIcon
              ? widget.isPassword
              ? GestureDetector(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Center(
                  child: obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off)

                // Text(
                //   (obscureText
                //       ? MyStrings.show.tr
                //       : MyStrings.hide.tr),
                //   style: boldDefault.copyWith(
                //     color: obscureText
                //         ? MyColor.primaryColor
                //         : MyColor.hintTextColor,
                //   ),
                // ),
              ),
            ),
          )
              : widget.isIcon
              ? IconButton(
            onPressed: widget.onSuffixTap,
            icon: Icon(
              widget.isSearch
                  ? Icons.search_outlined
                  : widget.isCountryPicker
                  ? Icons.arrow_drop_down_outlined
                  : Icons.camera_alt_outlined,
              size: 25,
              color: MyColor.getPrimaryColor(),
            ),
          )
              : widget.suffixWidget
              : null,
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) => widget.onChanged!(text),
      ),
    )
        : Stack(
      children: [
        Container(
          height: 47,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: MyColor.getCardBgColor(),
              borderRadius: BorderRadius.circular(widget.radius!),
              boxShadow: MyUtils.getShadow2(blurRadius: 5)),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyMedium: widget.autofillHintStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: MyColor.primaryButtonColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'digital_font',
                  ),
            ),
          ),
          child: TextFormField(
            autofillHints: widget.autofillHints,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            style: regularDefault.copyWith(
                color: MyColor.getTextColor()),
            textAlign: TextAlign.left,
            cursorColor: MyColor.colorBlack,
            controller: widget.controller,
            autofocus: false,
            textInputAction: widget.inputAction,
            enabled: widget.isEnable,
            focusNode: widget.focusNode,
            validator: widget.validator,
            keyboardType: widget.textInputType,
            obscureText: widget.isPassword ? obscureText : false,
            onTap: widget.onTap,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding ??  EdgeInsets.only(
                  top: 0, left: 15, right: 15, bottom: 0),
              labelText: widget.labelText,
              labelStyle: regularDefault.copyWith(
                  color: MyColor.getLabelTextColor()),
              fillColor: widget.fillColor,
              filled: true,
              hintStyle: widget.hintTextStyle ??
                  TextStyle(color: MyColor.getRideSubTitleColor()),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.textFieldDisableBorderColor,
                      width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.textFieldEnableBorderColor,
                      width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: MyColor.getTextFieldDisableBorder(),
                      width: 0.5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.colorRed, width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.colorRed, width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              prefixIconConstraints:
              BoxConstraints.loose(Size(40, 40)),
              suffixIcon: widget.isShowSuffixIcon
                  ? widget.isPassword
                  ? GestureDetector(
                onTap: _toggle,
                child: Padding(
                    padding:
                    const EdgeInsets.only(right: 4.0),
                    child: obscureText
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off)

                  // Text(
                  //   (obscureText ? "Show" : "Hide").tr,
                  //   style: boldDefault.copyWith(
                  //     color: obscureText
                  //         ? MyColor.primaryColor
                  //         : MyColor.hintTextColor,
                  //   ),
                  // ),
                ),
              )
                  : widget.isIcon
                  ? IconButton(
                onPressed: widget.onSuffixTap,
                icon: Icon(
                  widget.isSearch
                      ? Icons.search_outlined
                      : widget.isCountryPicker
                      ? Icons
                      .arrow_drop_down_outlined
                      : Icons.camera_alt_outlined,
                  size: 25,
                  color: MyColor.getPrimaryColor(),
                ),
              )
                  : null
                  : null,
            ),
            onFieldSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context)
                .requestFocus(widget.nextFocus)
                : null,
            onChanged: (text) => widget.onChanged!(text),
          ),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel && widget.labelText != null && widget.labelText!.isNotEmpty) // Modified condition
          LabelText(
            text: widget.labelText.toString(),
            isRequired: widget.isRequired,
          ),
        // LabelText(
        //   text: widget.labelText.toString(),
        //   isRequired: widget.isRequired,
        // ),
        // const SizedBox(height: Dimensions.textToTextSpace),
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyMedium: widget.autofillHintStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: MyColor.primaryButtonColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'digital_font',
                  ),
            ),
          ),
          child: TextFormField(
            autofillHints: widget.autofillHints,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            style:
            TextStyle(
              fontSize: 14,
              color: themeController.isDarkMode.value?MyColor.colorWhite:MyColor.primaryColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'digital_font',),
            //textAlign: TextAlign.left,
            cursorColor: MyColor.getTextColor(),

            controller: widget.controller,
            autofocus: false,
            textInputAction: widget.inputAction,
            enabled: widget.isEnable,
            focusNode: widget.focusNode,
            validator: widget.validator,
            keyboardType: widget.textInputType,
            obscureText: widget.isPassword ? obscureText : false,
            inputFormatters: widget.inputFormatters,
            onTap: widget.onTap,
            decoration: InputDecoration(
              contentPadding: widget.contentPadding ??  EdgeInsetsDirectional.only(
                  top: 0, start: 15, end: 15, bottom: 0),
              hintText:
              widget.hintText != null ? widget.hintText!.tr : '',
              hintStyle: widget.hintTextStyle ??
                  regularLarge.copyWith(
                    color: themeController.isDarkMode.value?MyColor.colorWhite:MyColor.getHintTextColor()
                        .withValues(alpha: 0.7),
                  ),
              fillColor: widget.fillColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5, color: MyColor.secondaryColor),
                  borderRadius: BorderRadius.circular(widget.radius!)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: widget.focusColor ?? MyColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: themeController.isDarkMode.value? 0.5: 0.5,
                      color: MyColor.getTextFieldDisableBorder()),
                  borderRadius: BorderRadius.circular(widget.radius!)),
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
              isDense: widget.isDense,
              suffixIconConstraints: widget.suffixIconConstraints ??
                  BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 70,
                      minHeight: 40,
                      minWidth: 50),
              suffixIcon: widget.isShowSuffixIcon
                  ? widget.isPassword
                  ? Center(
                child: GestureDetector(
                  onTap: _toggle,
                  child: Padding(
                      padding:
                      const EdgeInsets.only(right: 4.0),
                      child: obscureText
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off)

                    // Text(
                    //   (obscureText ? "Show" : "Hide").tr,
                    //   style: boldDefault.copyWith(
                    //     color: obscureText
                    //         ? MyColor.primaryColor
                    //         : MyColor.hintTextColor,
                    //   ),
                    // ),
                  ),
                ),
              )
                  : widget.isIcon
                  ? IconButton(
                onPressed: widget.onSuffixTap,
                icon: Icon(
                  widget.isSearch
                      ? Icons.search_outlined
                      : widget.isCountryPicker
                      ? Icons.arrow_drop_down_outlined
                      : Icons.camera_alt_outlined,
                  size: 25,
                  color: MyColor.getPrimaryColor(),
                ),
              )
                  : widget.suffixWidget
                  : null,
            ),
            onFieldSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit != null
                ? widget.onSubmit!()
                : null,
            onChanged: (text) => widget.onChanged!(text),
          ),
        )
      ],
    )
        : widget.isborderNone
        ? Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style: regularDefault.copyWith(color: MyColor.getTextColor()),
        //textAlign: TextAlign.left,
        cursorColor: MyColor.getPrimaryColor(),
        controller: widget.controller,
        autofocus: false,
        textInputAction: widget.inputAction,
        enabled: widget.isEnable,
        focusNode: widget.focusNode,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? obscureText : false,
        inputFormatters: widget.inputFormatters,
        onTap: widget.onTap,
        decoration: InputDecoration(
          isDense: widget.isDense,
          contentPadding: widget.contentPadding ??  EdgeInsetsDirectional.only(
              top: 0, start: 0, end: 0, bottom: 0),
          labelText: widget.labelText?.tr,
          labelStyle: regularDefault.copyWith(
              color: MyColor.getLabelTextColor()),
          fillColor: widget.fillColor,
          filled: true,
          border: InputBorder.none,
          hintText: widget.hintText != null ? widget.hintText!.tr : '',
          hintStyle: regularLarge.copyWith(
              color: MyColor.getHintTextColor().withValues(alpha: 0.7)),
          prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
          suffixIconConstraints: widget.suffixIconConstraints ??
              BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 70,
                  minHeight: 40,
                  minWidth: 50),
          suffixIcon: widget.isShowSuffixIcon
              ? widget.isPassword
              ? GestureDetector(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Center(
                  child: obscureText
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off)
                // Text(
                //   (obscureText ? "Show" : "Hide").tr,
                //   style: boldDefault.copyWith(
                //     color: obscureText
                //         ? MyColor.primaryColor
                //         : MyColor.hintTextColor,
                //   ),
                // ),
              ),
            ),
          )
              : widget.isIcon
              ? IconButton(
            onPressed: widget.onSuffixTap,
            icon: Icon(
              widget.isSearch
                  ? Icons.search_outlined
                  : widget.isCountryPicker
                  ? Icons.arrow_drop_down_outlined
                  : Icons.camera_alt_outlined,
              size: 25,
              color: MyColor.getPrimaryColor(),
            ),
          )
              : widget.suffixWidget
              : null,
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) => widget.onChanged!(text),
      ),
    )
        : Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style: regularDefault,
        onTap: widget.onTap,
        cursorColor: MyColor.getHintTextColor(),
        controller: widget.controller,
        autofocus: false,
        textInputAction: widget.inputAction,
        enabled: widget.isEnable,
        focusNode: widget.focusNode,
        validator: widget.validator,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? obscureText : false,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          isDense: widget.isDense,
          contentPadding: widget.contentPadding ??  EdgeInsetsDirectional.only(
              top: 0, start: 0, end: 0, bottom: 0),
          labelText: widget.labelText?.tr,
          labelStyle: regularDefault.copyWith(
              color: MyColor.getLabelTextColor()),
          fillColor: widget.fillColor,
          filled: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 0.5, color: MyColor.getTextFieldDisableBorder()),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: widget.focusColor ??
                  MyColor.getTextFieldEnableBorder(),
            ),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 0.5,
                  color: MyColor.getTextFieldDisableBorder())),
          prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
          suffixIcon: widget.isShowSuffixIcon
              ? widget.isPassword
              ? GestureDetector(
            onTap: _toggle,
            child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: obscureText
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)

              // Text(
              //   (obscureText ? "Show" : "Hide").tr,
              //   style: boldDefault.copyWith(
              //     color: obscureText
              //         ? MyColor.primaryColor
              //         : MyColor.hintTextColor,
              //   ),
              // ),
            ),
          )
              : widget.isIcon
              ? IconButton(
            onPressed: widget.onSuffixTap,
            icon: Icon(
              widget.isSearch
                  ? Icons.search_outlined
                  : widget.isCountryPicker
                  ? Icons.arrow_drop_down_outlined
                  : Icons.camera_alt_outlined,
              size: 25,
              color: MyColor.getPrimaryColor(),
            ),
          )
              : widget.suffixWidget
              : null,
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) => widget.onChanged!(text),
      ),
    );
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

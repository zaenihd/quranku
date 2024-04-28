import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TxtForm extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Function() onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool obsecureText;
  final bool? enable;
  final String? initialValue;
  final EdgeInsetsGeometry? padding;
  final TextStyle? hintStyle;
  final int? maxLines, maxLength;
  final Color? borderColor;

  const TxtForm({
    Key? key,
    this.padding,
    this.hintStyle,
    this.hintText = '',
    this.validate,
    this.borderColor,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.maxLines,
    this.label = '',
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.obsecureText = false,
    this.enable = true,
    this.initialValue,
    required this.onTap,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TxtFormState createState() => _TxtFormState();
}

class _TxtFormState extends State<TxtForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        maxLines: widget.maxLines ?? 1,
        maxLength: widget.maxLength,
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom),
        initialValue: widget.initialValue,
        autocorrect: false,
        onTap: widget.onTap,
        enabled: widget.enable,
        enableInteractiveSelection: true,
        cursorColor: Colors.grey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.onChange,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        obscureText: widget.obsecureText,
        inputFormatters: widget.inputFormatters,
        textCapitalization: widget.textCapitalization,
        validator: widget.validate,
        // style: TextStyles.body2,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: widget.suffixIcon,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            hintText: widget.hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black)),
            focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:widget.borderColor ?? Colors.black),
            ),
            // e
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:  BorderSide(
                color:widget.borderColor ?? Colors.black,
                width: 1.0,
              ),
            ),
            // nabledBorder: BorderStyles.enableTextField,
            // errorBorder: BorderStyles.errorTextField,
            // disabledBorder: BorderStyles.disableTextField,
            errorMaxLines: 5,
            prefixIcon: widget.prefixIcon,
            // prefixIconConstraints:
            //     BoxConstraints(minHeight: Sizes.lg, minWidth: Sizes.xl),
            hintStyle: widget.hintStyle ??
                const TextStyle(fontSize: 14, color: Colors.grey)),
      ),
    );
  }
}

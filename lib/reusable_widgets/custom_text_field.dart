import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
        this.controller,
        this.hintText,
        this.inputType,
        this.prefixIcon,
        this.textAlignCenter,
        this.autoFocus,
        this.enableSuggestions,
        this.autoCorrect,
        this.showSuffix,
        this.obscureText,
        this.isEnabled,
        this.maxLines})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final Icon? prefixIcon;
  final bool? textAlignCenter;
  final bool? autoFocus;
  final bool? enableSuggestions;
  final bool? autoCorrect;
  final bool? showSuffix;
  final bool? obscureText;
  final bool? isEnabled;
  final int? maxLines;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      enabled: widget.isEnabled ?? true,
      autofocus: widget.autoFocus ?? false,
      controller: widget.controller,
      keyboardType: widget.inputType ?? TextInputType.text,
      maxLines: widget.maxLines ?? 1,
      obscureText: widget.obscureText ?? false,
      enableSuggestions: widget.enableSuggestions ?? true,
      autocorrect: widget.autoCorrect ?? true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white70.withOpacity(.5),
        prefixIcon: widget.prefixIcon,
        border: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Color(0x61E1453C))
          //borderSide: const BorderSide(),
        ),

        hintText: widget.hintText,
        // hintStyle: TextStyle(fontSize: 18, color: Colors.black87),
      ),
    );
  }
}

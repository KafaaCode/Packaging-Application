import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldAuth extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isPassword;
  final void Function(String)? onChanged;
  final String? svgIcon;
  final Color? colorIcon;
  final int? maxLines;
  final int? minLines;

  const TextFieldAuth(
      {super.key,
      this.labelText,
      this.hintText,
      this.controller,
      this.isPassword,
      this.maxLines,
      this.minLines,
      this.svgIcon,
      this.colorIcon = const Color.fromRGBO(194, 194, 194, 1),
      this.onChanged});

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword ?? false;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return TextField(
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      onChanged: widget.onChanged,
      controller: widget.controller,
      obscureText: widget.isPassword == true ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: const Color.fromRGBO(0, 0, 0, 0.5),
        ),
        suffixIcon: widget.svgIcon != null
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  widget.svgIcon!,
                  colorFilter: ColorFilter.mode(
                    widget.colorIcon ?? theme.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        // filled: true,
        // fillColor: Colors.grey[200],
      ),
    );
  }
}

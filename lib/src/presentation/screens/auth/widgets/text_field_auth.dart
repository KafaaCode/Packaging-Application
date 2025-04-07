import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TextFieldAuth extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool? isPassword;
  final String svgIcon; // تم تغيير نوع الأيقونة لاستقبال مسار SVG

  const TextFieldAuth({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.isPassword,
    required this.svgIcon, // أصبحت إلزامية
  });

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
      controller: widget.controller,
      obscureText: widget.isPassword == true ? _obscureText : false,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            widget.svgIcon,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
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

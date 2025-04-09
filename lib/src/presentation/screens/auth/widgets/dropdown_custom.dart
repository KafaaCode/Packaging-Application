import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropdownCustom extends StatefulWidget {
  final List<String> items;

  final String? defaultValue;

  final ValueChanged<String?> onChanged;

  final String? labelText;

  final String svgIcon;

  const DropdownCustom({
    super.key,
    required this.items,
    required this.onChanged,
    this.defaultValue,
    this.labelText,
    required this.svgIcon,
  });

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  late String? selectedValue;

  @override
  void initState() {
    super.initState();

    selectedValue = widget.defaultValue ??
        (widget.items.isNotEmpty ? widget.items.first : null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InputDecorator(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        hintText: widget.labelText,
        labelStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
        hintStyle: theme.textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              widget.svgIcon,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.srcIn,
              ),
            ),
          ),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue;
            });

            widget.onChanged(newValue);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/utils/abstracts.dart';

class DropdownCustom<T extends HasIdAndName> extends StatefulWidget {
  final List<T> items;
  final T? defaultValue;
  final ValueChanged<T?> onChanged;
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
  State<DropdownCustom<T>> createState() => _DropdownCustomState<T>();
}

class _DropdownCustomState<T extends HasIdAndName>
    extends State<DropdownCustom<T>> {
  late T? selectedValue;

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
        child: DropdownButton<T>(
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
          items: widget.items.map((T value) {
            return DropdownMenuItem<T>(
              value: value,
              child: Text(
                value.name,
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

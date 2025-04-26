import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frip_trading/core/localization/generated/l10n.dart';
import 'package:frip_trading/core/utils/abstracts.dart';

class DropdownCustom<T extends HasIdAndName> extends StatefulWidget {
  final List<T> items;
  final T? defaultValue;
  final ValueChanged<T?> onChanged;
  final String? labelText;
  final InputDecoration? decoration;
  final String svgIcon;

  const DropdownCustom({
    super.key,
    required this.items,
    required this.onChanged,
    this.defaultValue,
    this.labelText,
    required this.svgIcon,
    this.decoration,
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
    ThemeData theme = Theme.of(context);
    Lang lang = Lang.of(context);
    return InputDecorator(
      decoration: widget.decoration == null
          ? InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
            )
          : widget.decoration ?? const InputDecoration(),
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

import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final Widget child;
  final String tilte;
  final VoidCallback? onPressed;
  final Widget icon;
  const CustomAppbar(
      {super.key,
      required this.child,
      this.onPressed,
      required this.tilte,
      required this.icon});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: Stack(
        // alignment: Alignment.topCenter,
        // clipBehavior: Clip.none,
        // fit: StackFit.expand,
        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          widget.child,
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Focus(
                        focusNode: _focusNode,
                        child: InkWell(
                          onTap: () {
                            _focusNode.requestFocus();
                            if (widget.onPressed != null) widget.onPressed!();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: widget.icon,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.tilte,
                          textAlign: TextAlign.start,
                          style: theme.textTheme.headlineLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget child;
  final String tilte;
  final Function()? onPressed;
  final Widget icon;
  const CustomAppbar(
      {super.key,
      required this.child,
      this.onPressed,
      required this.tilte,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        // clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onPressed,
                  child: Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: icon,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(tilte,
                        textAlign: TextAlign.start,
                        style: theme.textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            ),
          ),
          child,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OptionFilter extends StatelessWidget {

 final VoidCallback onTap;
  const OptionFilter({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
                    onTap: onTap,
                    borderRadius: BorderRadius.circular(10),
      child: Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF70b9be),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/FontAwesomeIcons.png',
                          width: 25,
                          height: 25,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(width: 25, height: 25);
                          },
                        ),
                      ),
                    ),
    );
  }
}